require 'rails_helper'

RSpec.describe 'Users Registrations', type: :request do
  include_context 'api request authentication helper methods'
  include_context 'api request global before and after hooks'

  let(:user_params) do
    { user: { email: 'username+1@basicinc.jp', password: 'password', service: 4 } }
  end

  context 'POST /users (ユーザー登録)' do
    context 'メール認証が不要なとき' do
      it '登録完了' do
        post '/users', user_params
        rsa_public = OpenSSL::PKey.read ENV['RSA_PUBLIC']
        session_data = JWT.decode JSON.parse(response.body)['token'], rsa_public, true, algorithm: 'RS256'
        expect(response.status).to eq 200
        p session_data.first.deep_symbolize_keys
        expect(session_data.first.deep_symbolize_keys[:email]).to eq user_params[:user][:email]
        expect(response).to match_response_schema('/users')
      end
    end

    context 'FerretPLUSのとき' do
      it '登録日がregdateに入ってcreated_atに入らないこと' do
        post '/users', user_params.deep_merge(user: { service: 2 })
        expect(User.first.service).to eq 2
        expect(User.first.created_at).to be_nil
        expect(User.first.regdate).not_to be_nil
      end
    end

    context 'メール認証が必要なとき' do
      it '本登録が必要なこと' do
        post '/users', user_params.deep_merge(user: { service: 2 })
        expect(response.status).to eq 200
        expect(flash[:alert]).to be_include I18n.t 'devise.failure.unconfirmed'
        expect(User.first.service).to eq 2
        expect(User.first.confirmed_at.nil?).to eq true
        expect(User.first.created_at).to be_nil
        expect(User.first.regdate).not_to be_nil
      end

      it '本登録が必要でログイン出来ないこと' do
        post '/users', user_params.deep_merge(user: { service: 2 })
        post '/users/sign_in', user_params.deep_merge(user: { service: 2, remember_me: 0 })
        expect(response.status).to eq 302
        expect(flash[:alert]).to be_include I18n.t 'devise.failure.unconfirmed'
        expect(User.first.created_at).to be_nil
        expect(User.first.regdate).not_to be_nil
      end

      it 'メール認証が通ること' do
        post '/users', user_params.deep_merge(user: { service: 2 })
        mail_id = User.first.uid - 1
        authenticate_url = URI.extract(ActionMailer::Base.deliveries[mail_id].body.raw_source, ['http']).first.to_s
        get authenticate_url
        expect(flash[:notice]).to eq I18n.t 'devise.confirmations.confirmed'
        expect(User.first.created_at).to be_nil
        expect(User.first.regdate).not_to be_nil
      end

      it 'メール認証が通りログイン出来ること' do
        post '/users', user_params.deep_merge(user: { service: 2 })
        mail_id = User.first.uid - 1
        authenticate_url = URI.extract(ActionMailer::Base.deliveries[mail_id].body.raw_source, ['http']).first.to_s
        get authenticate_url
        post '/users/sign_in', user_params.deep_merge(user: { service: 2, remember_me: 0 })
        rsa_public = OpenSSL::PKey.read ENV['RSA_PUBLIC']
        session_data = JWT.decode JSON.parse(response.body)['token'], rsa_public, true, algorithm: 'RS256'
        expect(response.status).to eq 200
        expect(session_data.first.deep_symbolize_keys[:email]).to eq user_params[:user][:email]
        expect(response).to match_response_schema('/users')
        expect(User.first.created_at).to be_nil
        expect(User.first.regdate).not_to be_nil
      end
    end

    context 'twitter認証' do
      context 'twitter omniauth 認証のリダイレクト' do
        it 'omniauth_callbacks_controller にリダイレクトされること' do
          get '/users/auth/twitter?service=4'
          expect(response.status).to eq 302
          expect(response.location).to be_include '/users/auth/twitter/callback'
        end
      end

      context 'service == 2 のとき' do
        it '正しい id_twitter が返ってくること' do
          get '/users/auth/twitter?service=2'
          get '/users/auth/twitter/callback'
          expect(request.env['omniauth.params']['service'].to_i).to eq 2
          expect(response.body).to be_include 'id_twitter'
          expect(response.body).to be_include 'twitter12345'
        end
      end

      context 'service != 2 のとき' do
        it '正しい twitter_id が返ってくること' do
          get '/users/auth/twitter?service=4'
          get '/users/auth/twitter/callback'
          expect(request.env['omniauth.params']['service'].to_i).to eq 4
          expect(response.body).to be_include 'twitter_id'
          expect(response.body).to be_include 'twitter12345'
        end
      end

      context 'twitter認証後に登録リクエストが来たとき' do
        it 'FerretPLUS以外のとき登録完了' do
          post '/users', user_params.deep_merge(user: { twitter_id: '12345' })
          expect(User.first.twitter_id).to eq '12345'
        end

        it 'FerretPLUSのとき登録完了' do
          post '/users', user_params.deep_merge(user: { service: 2, id_twitter: '12345' })
          expect(User.first.id_twitter).to eq '12345'
          expect(User.first.created_at).to be_nil
          expect(User.first.regdate).not_to be_nil
        end
      end

      context 'twitter認証が既にされているとき' do
        context 'twitter_idが既に存在するとき' do
          before { create(:already_confirmed_twitter_user_service4) }
          it 'should be invalid' do
            get '/users/auth/twitter?service=4'
            get '/users/auth/twitter/callback'
            expect(response.body).to be_include I18n.t 'errors.messages.already_confirmed'
          end
        end

        context 'id_twitterが既に存在するとき' do
          before { create(:already_confirmed_twitter_user_service2) }
          it 'should be invalid' do
            get '/users/auth/twitter?service=2'
            get '/users/auth/twitter/callback'
            expect(response.body).to be_include I18n.t 'errors.messages.already_confirmed'
          end
        end
      end
    end

    context 'facebook認証' do
      context 'facebook omniauth 認証のリダイレクト' do
        it 'omniauth_callbacks_controller にリダイレクトされること' do
          get '/users/auth/facebook?service=4'
          expect(response.status).to eq 302
          expect(response.location).to be_include '/users/auth/facebook/callback'
        end
      end

      context 'service == 2 のとき' do
        it '正しい id_facebook が返ってくること' do
          get '/users/auth/facebook?service=2'
          get '/users/auth/facebook/callback'
          expect(request.env['omniauth.params']['service'].to_i).to eq 2
          expect(response.body).to be_include 'id_facebook'
          expect(response.body).to be_include 'facebook12345'
        end
      end

      context 'service != 2 のとき' do
        it '正しい facebook_id が返ってくること' do
          get '/users/auth/facebook?service=4'
          get '/users/auth/facebook/callback'
          expect(request.env['omniauth.params']['service'].to_i).to eq 4
          expect(response.body).to be_include 'facebook_id'
          expect(response.body).to be_include 'facebook12345'
        end
      end

      context 'facebook認証後に登録リクエストが来たとき' do
        it '登録完了' do
          post '/users', user_params.deep_merge(user: { facebook_id: 'facebook12345' })
          expect(User.first.facebook_id).to eq 'facebook12345'
        end
      end

      context 'facebook認証が既にされているとき' do
        context 'facebook_idが既に存在するとき' do
          before { create(:already_confirmed_facebook_user_service4) }
          it 'should be invalid' do
            get '/users/auth/facebook?service=4'
            get '/users/auth/facebook/callback'
            expect(response.body).to be_include I18n.t 'errors.messages.already_confirmed'
          end
        end

        context 'id_facebookが既に存在するとき' do
          before { create(:already_confirmed_facebook_user_service2) }
          it 'should be invalid' do
            get '/users/auth/facebook?service=2'
            get '/users/auth/facebook/callback'
            expect(response.body).to be_include I18n.t 'errors.messages.already_confirmed'
          end
        end
      end
    end

    context 'yahoojp認証' do
      context 'yahoojp omniauth 認証のリダイレクト' do
        it 'omniauth_callbacks_controller にリダイレクトされること' do
          get '/users/auth/yahoojp?service=4'
          expect(response.status).to eq 302
          expect(response.location).to be_include '/users/auth/yahoojp/callback'
        end
      end

      context 'service != 4 のとき' do
        it 'アクセス出来ないこと' do
          get '/users/auth/yahoojp?service=2'
          get '/users/auth/yahoojp/callback'
          expect(request.env['omniauth.params']['service'].to_i).to eq 2
          expect(response.status).to eq 403
          expect(response.body).to be_include I18n.t 'errors.messages.forbidden'
        end
      end

      context 'service == 4 のとき' do
        it '正しい yahoojp_id が返ってくること' do
          get '/users/auth/yahoojp?service=4'
          get '/users/auth/yahoojp/callback'
          expect(request.env['omniauth.params']['service'].to_i).to eq 4
          expect(response.body).to be_include 'yahoojp_id'
          expect(response.body).to be_include 'yahoojp12345'
        end
      end

      context 'yahoojp認証後に登録リクエストが来たとき' do
        it '登録完了' do
          post '/users', user_params.deep_merge(user: { yahoojp_id: 'yahoojp12345' })
          expect(User.first.yahoojp_id).to eq 'yahoojp12345'
        end
      end

      context 'yahoojp認証が既にされているとき' do
        context 'yahoojp_idが既に存在するとき' do
          before { create(:already_confirmed_yahoojp_user_service4) }
          it 'should be invalid' do
            get '/users/auth/yahoojp?service=4'
            get '/users/auth/yahoojp/callback'
            expect(response.body).to be_include I18n.t 'errors.messages.already_confirmed'
          end
        end
      end
    end

    context 'すでにユーザー登録されているとき' do
      before { create(:user) }
      it 'should be invalid' do
        post '/users', user_params
        expect(response.status).to eq(422)
        expect(response.body).to be_include I18n.t 'errors.messages.taken'
      end
    end

    context 'メールが空のとき' do
      it 'should be invalid' do
        post '/users', user: { email: '', password: 'password' }
        expect(response.status).to eq 422
        expect(response.body).to be_include I18n.t 'errors.messages.blank'
      end
    end
  end

  context 'PATCH /users (ユーザー情報の更新)' do
    context '未記入がない場合' do
      before { create(:user) }
      it 'ユーザ情報が更新出来ること' do
        sign_in(User.first)
        patch '/users', user: { email: 'changed@basicinc.jp', password: 'password',
                                password_confirmation: 'password', current_password: 'password' }
        expect(response.status).to eq 204
        expect(User.first.email1).to eq 'changed@basicinc.jp'
        expect(flash[:notice]).to eq I18n.t 'devise.registrations.updated'
      end
    end

    context 'メールが空のとき' do
      before { create(:user) }
      it 'should be invalid' do
        sign_in(User.first)
        patch '/users', user: { email: '', password: 'password',
                                password_confirmation: 'password', current_password: 'password' }
        expect(response.status).to eq 422
        expect(response.body).to be_include I18n.t 'errors.messages.blank'
      end
    end
  end

  context 'DELETE /users (ユーザー削除)' do
    before { create(:user) }
    it '論理削除出来ること' do
      sign_in(User.first)
      delete '/users'
      expect(response.status).to eq 200
      expect(JSON.parse(response.body)['token']).to eq ''
      expect(User.first.uid).to eq 1
      expect(User.first.nname).to eq 'DELETE'
      expect(User.first.email1).to eq '000@000.000'
      expect(User.first.memstate).to eq 9
    end
  end
end
