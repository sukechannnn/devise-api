require 'rails_helper'

RSpec.describe 'Users Registrations', type: :request do
  include_context 'api request authentication helper methods'
  include_context 'api request global before and after hooks'

  let(:user_params) do
    { user: { email: 'username+1@basicinc.jp', password: 'password', service: 4 } }
  end

  context 'POST /users (ユーザー登録) when no need mail registration' do
    it '登録完了' do
      post '/users', user_params
      rsa_public = OpenSSL::PKey.read ENV['RSA_PUBLIC']
      session_data = JWT.decode JSON.parse(response.body)['token'], rsa_public, true, algorithm: 'RS256'
      expect(response.status).to eq 200
      p session_data.first.deep_symbolize_keys
      expect(session_data.first.deep_symbolize_keys[:email]).to eq 'username+1@basicinc.jp'
      expect(response).to match_response_schema('/users')
    end
  end

  context 'POST /users (ユーザー登録) when need mail registration' do
    it '本登録が必要なこと' do
      post '/users', user_params.deep_merge(user: { service: 2 })
      expect(response.status).to eq 200
      expect(flash[:alert]).to be_include I18n.t 'devise.failure.unconfirmed'
      expect(User.first.service).to eq 2
      expect(User.first.confirmed_at.nil?).to eq true
    end
  end

  context 'POST /users (ユーザー登録) when need mail registration' do
    it '本登録が必要でログイン出来ないこと' do
      post '/users', user_params.deep_merge(user: { service: 2 })
      post '/users/sign_in', user_params.deep_merge(user: { service: 2, remember_me: 0 })
      expect(response.status).to eq 302
      expect(flash[:alert]).to be_include I18n.t 'devise.failure.unconfirmed'
    end
  end

  context 'POST /users (ユーザー登録) when need mail registration' do
    it 'メール認証が通ること' do
      post '/users', user_params.deep_merge(user: { service: 2 })
      mail_id = User.first.uid - 1
      authenticate_url = URI.extract(ActionMailer::Base.deliveries[mail_id].body.raw_source, ['http']).first.to_s
      get authenticate_url
      expect(flash[:notice]).to eq I18n.t 'devise.confirmations.confirmed'
    end
  end

  context 'POST /users (ユーザー登録) when need mail registration' do
    it 'メール認証が通りログイン出来ること' do
      post '/users', user_params.deep_merge(user: { service: 2 })
      mail_id = User.first.uid - 1
      authenticate_url = URI.extract(ActionMailer::Base.deliveries[mail_id].body.raw_source, ['http']).first.to_s
      get authenticate_url
      post '/users/sign_in', user_params.deep_merge(user: { service: 2, remember_me: 0 })
      rsa_public = OpenSSL::PKey.read ENV['RSA_PUBLIC']
      session_data = JWT.decode JSON.parse(response.body)['token'], rsa_public, true, algorithm: 'RS256'
      expect(response.status).to eq 200
      expect(session_data.first.deep_symbolize_keys[:email]).to eq 'username+1@basicinc.jp'
      expect(response).to match_response_schema('/users')
    end
  end

  context 'POST /users (ユーザー登録) & user is persisted' do
    before { create(:user) }
    it 'should be invalid' do
      post '/users', user_params
      expect(response.status).to eq(422)
      expect(response.body).to be_include('has already been taken')
    end
  end

  context 'POST /users (ユーザー登録) & email is blank' do
    it 'should be invalid' do
      post '/users', user: { email: '', password: 'password' }
      expect(response.status).to eq 422
      expect(response.body).to be_include("can't be blank")
    end
  end

  context 'PATCH /users (ユーザー情報の更新)' do
    before { create(:user) }
    it 'ユーザ情報が更新出来ること' do
      sign_in(User.first)
      patch '/users', user: { email: 'changed@basicinc.jp', password: 'password',
                              password_confirmation: 'password', current_password: 'password' }
      expect(response.status).to eq 204
      expect(User.first.email1).to eq('changed@basicinc.jp')
      expect(flash[:notice]).to eq I18n.t 'devise.registrations.updated'
    end
  end

  context 'PATCH /users (ユーザー情報の更新) & email is blank' do
    before { create(:user) }
    it 'should be invalid' do
      sign_in(User.first)
      patch '/users', user: { email: '', password: 'password',
                              password_confirmation: 'password', current_password: 'password' }
      expect(response.status).to eq 422
      expect(response.body).to be_include("can't be blank")
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
