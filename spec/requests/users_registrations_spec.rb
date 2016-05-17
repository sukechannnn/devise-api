require 'rails_helper'
require 'support/shared_contexts'

RSpec.describe 'Users Registrations', type: :request do
  include_context 'api request authentication helper methods'
  include_context 'api request global before and after hooks'

  let(:user_params) do
    { user: { email: 'username+1@basicinc.jp', password: 'password' } }
  end

  context 'POST /users (ユーザー登録)' do
    it 'should be valid' do
      post '/users', user_params
      rsa_public = OpenSSL::PKey.read ENV['RSA_PUBLIC']
      session_data = JWT.decode JSON.parse(response.body)['token'], rsa_public, true, algorithm: 'RS256'
      expect(response.status).to eq 200
      p response.body
      p session_data.first.deep_symbolize_keys
      expect(session_data.first.deep_symbolize_keys[:email]).to eq 'username+1@basicinc.jp'
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
    it 'should be valid' do
      sign_in(User.first)
      patch '/users', user: { email: 'changed@basicinc.jp', password: 'password',
                              password_confirmation: 'password', current_password: 'password' }
      expect(response.status).to eq 204
      expect(User.first.email1).to eq('changed@basicinc.jp')
      expect(flash[:notice]).to eq "アカウント情報を更新しました。"
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
    it 'should be valid' do
      sign_in(User.first)
      delete '/users'
      expect(response.status).to eq 200
      expect(JSON.parse(response.body)['token']).to eq ''
      expect(User.first).to be_nil
    end
  end
end
