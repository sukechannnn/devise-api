require 'rails_helper'

RSpec.describe 'Users Omniauth Callbacks', type: :request do
  include_context 'api request authentication helper methods'
  include_context 'api request global before and after hooks'
  include_context 'decode json web token'

  let(:user_params) do
    { user: { email: 'username+1@basicinc.jp', password: 'password', service: 4 } }
  end

  context 'twitter認証' do
    context 'twitter omniauth 認証のリダイレクト' do
      it 'omniauth_callbacks_controller にリダイレクトされること' do
        get '/users/auth/twitter?service=4'
        expect(response.status).to eq 302
        expect(response.location).to be_include '/users/auth/twitter/callback'
      end
    end

    context 'service が ferret plus のとき' do
      it 'プラスにリダイレクトされ、正しい id_twitter が返ってくること' do
        get '/users/auth/twitter?service=2'
        get '/users/auth/twitter/callback'
        expect(request.env['omniauth.params']['service'].to_i).to eq Settings.ferret.plus
        expect(response.status).to eq 302
        expect(response.location).to eq Application.plus_url
        expect(flash[:id_twitter]).to eq 'twitter12345'
      end
    end

    context 'service が ferret media のとき' do
      it 'メディアにリダイレクトされ、正しい twitter_id が返ってくること' do
        get '/users/auth/twitter?service=4'
        get '/users/auth/twitter/callback'
        expect(request.env['omniauth.params']['service'].to_i).to eq Settings.ferret.media
        expect(response.status).to eq 302
        expect(response.location).to eq Application.media_url
        expect(flash[:twitter_id]).to eq 'twitter12345'
      end
    end

    context 'twitter認証後に登録リクエストが来たとき' do
      it 'FerretPLUS以外のとき登録完了' do
        post '/users', user_params.deep_merge(user: { twitter_id: '12345' })
        expect(User.first.twitter_id).to eq '12345'
        session_data = decode_jwt response
        expect(session_data.first.deep_symbolize_keys[:email]).to eq user_params[:user][:email]
      end

      it 'FerretPLUSのとき、メール認証が必要なこと' do
        post '/users', user_params.deep_merge(user: { service: 2, id_twitter: '12345' })
        expect(User.first.id_twitter).to eq '12345'
        expect(User.first.created_at).to be_nil
        expect(User.first.regdate).not_to be_nil
        expect(flash[:alert]).to be_include I18n.t 'devise.failure.unconfirmed'
      end

      it 'メール認証が通ること' do
        ActionMailer::Base.deliveries.clear
        post '/users', user_params.deep_merge(user: { service: 2, id_twitter: '12345' })
        authenticate_url = URI.extract(ActionMailer::Base.deliveries.first.body.raw_source, ['http']).first.to_s
        get authenticate_url
        expect(flash[:notice]).to eq I18n.t 'devise.confirmations.confirmed'
      end
    end

    context 'twitter_idが既に存在するとき' do
      context '認証が完了していない場合' do
        it '各サービスにリダイレクトされ、ログインできないこと' do
          get '/users/auth/twitter?service=4'
          get '/users/auth/twitter/callback'
          expect(response.status).to eq 302
        end
      end

      context '認証が完了している場合' do
        before { create(:already_confirmed_twitter_user_service4) }
        it 'ログインされること' do
          get '/users/auth/twitter?service=4'
          get '/users/auth/twitter/callback'
          expect(response.status).to eq 200
          session_data = decode_jwt response
          expect(session_data.first.deep_symbolize_keys[:email]).to eq user_params[:user][:email]
        end
      end
    end

    context 'id_twitterが既に存在するとき' do
      context '認証が完了していない場合' do
        it '各サービスにリダイレクトされ、ログインできないこと' do
          get '/users/auth/twitter?service=2'
          get '/users/auth/twitter/callback'
          expect(response.status).to eq 302
        end
      end

      context '認証が完了している場合' do
        before { create(:already_confirmed_twitter_user_service2) }
        it 'ログインされること' do
          get '/users/auth/twitter?service=2'
          get '/users/auth/twitter/callback'
          expect(response.status).to eq 200
          session_data = decode_jwt response
          expect(session_data.first.deep_symbolize_keys[:email]).to eq user_params[:user][:email]
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

    context 'service が ferret plus のとき' do
      it '正しい id_facebook が返ってくること' do
        get '/users/auth/facebook?service=2'
        get '/users/auth/facebook/callback'
        expect(request.env['omniauth.params']['service'].to_i).to eq Settings.ferret.plus
        expect(response.status).to eq 302
        expect(response.location).to eq Application.plus_url
        expect(flash[:id_facebook]).to eq 'facebook12345'
      end
    end

    context 'service が ferret plus 以外のとき' do
      it '正しい facebook_id が返ってくること' do
        get '/users/auth/facebook?service=4'
        get '/users/auth/facebook/callback'
        expect(response.status).to eq 302
        expect(response.location).to eq Application.media_url
        expect(flash[:facebook_id]).to eq 'facebook12345'
      end
    end

    context 'facebook認証後に登録リクエストが来たとき' do
      it 'FerretPLUS以外のとき登録完了' do
        post '/users', user_params.deep_merge(user: { facebook_id: 'facebook12345' })
        expect(User.first.facebook_id).to eq 'facebook12345'
        session_data = decode_jwt response
        expect(session_data.first.deep_symbolize_keys[:email]).to eq user_params[:user][:email]
      end

      it 'FerretPLUSのとき、メール認証が必要なこと' do
        post '/users', user_params.deep_merge(user: { service: 2, id_facebook: '12345' })
        expect(User.first.id_facebook).to eq '12345'
        expect(User.first.created_at).to be_nil
        expect(User.first.regdate).not_to be_nil
        expect(flash[:alert]).to be_include I18n.t 'devise.failure.unconfirmed'
      end

      it 'メール認証が通ること' do
        ActionMailer::Base.deliveries.clear
        post '/users', user_params.deep_merge(user: { service: 2, id_twitter: '12345' })
        authenticate_url = URI.extract(ActionMailer::Base.deliveries.first.body.raw_source, ['http']).first.to_s
        get authenticate_url
        expect(flash[:notice]).to eq I18n.t 'devise.confirmations.confirmed'
      end
    end

    context 'facebook_idが既に存在するとき' do
      context '認証が完了していない場合' do
        it '各サービスにリダイレクトされ、ログインできないこと' do
          get '/users/auth/facebook?service=4'
          get '/users/auth/facebook/callback'
          expect(response.status).to eq 302
        end
      end

      context '認証が完了している場合' do
        before { create(:already_confirmed_facebook_user_service4) }
        it 'ログインされること' do
          get '/users/auth/facebook?service=4'
          get '/users/auth/facebook/callback'
          expect(response.status).to eq 200
          session_data = decode_jwt response
          expect(session_data.first.deep_symbolize_keys[:email]).to eq user_params[:user][:email]
        end
      end
    end

    context 'id_facebookが既に存在するとき' do
      context '認証が完了していない場合' do
        it 'ログインできないこと' do
          get '/users/auth/facebook?service=2'
          get '/users/auth/facebook/callback'
          expect(response.status).to eq 302
        end
      end

      context '認証が完了している場合' do
        before { create(:already_confirmed_facebook_user_service2) }
        it 'ログインされること' do
          get '/users/auth/facebook?service=2'
          get '/users/auth/facebook/callback'
          expect(response.status).to eq 200
          session_data = decode_jwt response
          expect(session_data.first.deep_symbolize_keys[:email]).to eq user_params[:user][:email]
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

    context 'service が ferret media のとき' do
      it '正しい yahoojp_id が返ってくること' do
        get '/users/auth/yahoojp?service=4'
        get '/users/auth/yahoojp/callback'
        expect(response.status).to eq 302
        expect(response.location).to eq Application.media_url
        expect(flash[:yahoojp_id]).to eq 'yahoojp12345'
      end
    end

    context 'service が ferret media 以外のとき' do
      it 'アクセス出来ないこと' do
        get '/users/auth/yahoojp?service=2'
        get '/users/auth/yahoojp/callback'
        expect(request.env['omniauth.params']['service'].to_i).to eq Settings.ferret.plus
        expect(response.status).to eq 403
        expect(response.body).to be_include I18n.t 'errors.messages.forbidden'
      end
    end

    context 'yahoojp認証後に登録リクエストが来たとき' do
      it '登録完了' do
        post '/users', user_params.deep_merge(user: { yahoojp_id: 'yahoojp12345' })
        expect(User.first.yahoojp_id).to eq 'yahoojp12345'
        session_data = decode_jwt response
        expect(session_data.first.deep_symbolize_keys[:email]).to eq user_params[:user][:email]
      end
    end

    context 'yahoojp_idが既に存在するとき' do
      context '認証が完了していない場合' do
        it 'ログインできないこと' do
          get '/users/auth/yahoojp?service=4'
          get '/users/auth/yahoojp/callback'
          expect(response.status).to eq 302
        end
      end

      context '認証が完了している場合' do
        before { create(:already_confirmed_yahoojp_user_service4) }
        it 'ログインされること' do
          get '/users/auth/yahoojp?service=4'
          get '/users/auth/yahoojp/callback'
          expect(response.status).to eq 200
          session_data = decode_jwt response
          expect(session_data.first.deep_symbolize_keys[:email]).to eq user_params[:user][:email]
        end
      end
    end
  end
end
