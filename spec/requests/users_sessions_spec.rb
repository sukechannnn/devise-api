require 'rails_helper'
require 'support/shared_contexts'

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
      expect(response.status).to eq 201
    end
  end

  context 'GET /users/sign_out (ログアウト)' do
    before { create(:user) }
    it 'should be valid' do
      sign_in(User.first)
      get '/users/sign_out'
      expect(response.status).to eq 302
    end
  end
end
