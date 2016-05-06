require 'rails_helper'
require 'support/shared_contexts'

RSpec.describe 'Users', type: :request do
  include_context "api request authentication helper methods"
  include_context "api request global before and after hooks"

  let(:user_params) do
    { user: { email: 'username+1@basicinc.jp', password: 'password' } }
  end

  describe 'JWT' do
    context 'POST /users' do
      it 'should be valid' do
        post '/users', user_params
        expect(response.status).to eq(302)
        expect(response).to redirect_to '/'
      end
    end

    context 'POST /users/sign_in' do
      before { create(:user) }
      it 'should be valid' do
        post '/users/sign_in', user_params.deep_merge(user: { remember_me: 0 })
        expect(response.status).to eq(302)
        expect(response).to redirect_to '/'
      end
    end

    context 'PATCH /users' do
      before { create(:user) }
      it 'should be valid' do
        sign_in(User.first)
        patch '/users', user: { email: 'username+1@basicinc.jp', password: 'password',
                                password_confirmation: 'password', current_password: 'password' }
        expect(response.status).to eq(302)
      end
    end
  end
end
