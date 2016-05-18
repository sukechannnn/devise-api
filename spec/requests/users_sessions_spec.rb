require 'rails_helper'

RSpec.describe 'Users Sessions', type: :request do
  include_context 'api request authentication helper methods'
  include_context 'api request global before and after hooks'

  let(:user_params) do
    { user: { email: 'username+1@basicinc.jp', password: 'password' } }
  end

  context 'POST /users/sign_in (ログイン)' do
    before { create(:user) }
    it 'should be valid' do
      post '/users/sign_in', user_params.deep_merge(user: { remember_me: 0 })
      rsa_public = OpenSSL::PKey.read ENV['RSA_PUBLIC']
      session_data = JWT.decode JSON.parse(response.body)['token'], rsa_public, true, algorithm: 'RS256'
      expect(response.status).to eq 200
      p session_data.first.deep_symbolize_keys
      expect(session_data.first.deep_symbolize_keys[:email]).to eq 'username+1@basicinc.jp'
      expect(response).to match_response_schema('/users/sign_in')
    end
  end

  context 'POST /users/sign_in (ログイン) & already signed in' do
    before { create(:user) }
    it 'should be valid' do
      sign_in(User.first)
      post '/users/sign_in', user_params.deep_merge(user: { remember_me: 0 })
      expect(response.status).to eq 302
    end
  end

  context 'POST /users/sign_in (ログイン) & password is blank' do
    before { create(:user) }
    it 'should be invalid' do
      post '/users/sign_in', user: { email: 'incorrect@basicinc.jp', password: '', remember_me: 0 }
      expect(response.status).to eq 422
      expect(JSON.parse(response.body)['alert']).to eq 'メールアドレスまたはパスワードが違います。'
      expect(flash[:alert]).to eq 'メールアドレスまたはパスワードが違います。'
    end
  end

  context 'POST /users/sign_in (ログイン) & email is blank' do
    before { create(:user) }
    it 'should be invalid' do
      post '/users/sign_in', user: { email: '', password: 'password', remember_me: 0 }
      expect(response.status).to eq 422
      expect(JSON.parse(response.body)['alert']).to eq 'メールアドレスまたはパスワードが違います。'
      expect(flash[:alert]).to eq 'メールアドレスまたはパスワードが違います。'
    end
  end

  context 'POST /users/sign_in (ログイン) & incorrect email' do
    before { create(:user) }
    it 'should be invalid' do
      post '/users/sign_in', user: { email: 'incorrect@basicinc.jp', password: 'password', remember_me: 0 }
      expect(response.status).to eq 422
      expect(JSON.parse(response.body)['alert']).to eq 'メールアドレスまたはパスワードが違います。'
      expect(flash[:alert]).to eq 'メールアドレスまたはパスワードが違います。'
    end
  end

  context 'POST /users/sign_in (ログイン) & incorrect password' do
    before { create(:user) }
    it 'should be invalid' do
      post '/users/sign_in', user: { email: 'username+1@basicinc.jp', password: 'incorrect', remember_me: 0 }
      expect(response.status).to eq 422
      expect(JSON.parse(response.body)['alert']).to eq 'メールアドレスまたはパスワードが違います。'
      expect(flash[:alert]).to eq 'メールアドレスまたはパスワードが違います。'
    end
  end

  context 'GET /users/sign_out (ログアウト)' do
    before { create(:user) }
    it 'should be valid' do
      sign_in(User.first)
      get '/users/sign_out'
      expect(response.status).to eq 200
      expect(JSON.parse(response.body)['token']).to eq ''
      expect(JSON.parse(response.body)['notice']).to eq 'ログアウトしました。'
      expect(flash[:notice]).to eq 'ログアウトしました。'
    end
  end
end
