require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'JWT' do
    context 'POST /users' do
      it 'should be valid' do
        post '/users', user: { email: 'username+1@basicinc.jp', password: 'password' }
        expect(response.status).to eq(302)
        expect(response).to redirect_to '/'
      end
    end

    context 'POST /users/sign_in' do
      before { create(:user) }
      it 'should be valid' do
        post '/users/sign_in', user: { email: 'username+1@basicinc.jp', password: 'password',
        remember_me: 0}
        expect(response.status).to eq(302)
        expect(response).to redirect_to '/'
      end
    end

    # NameError: uninitialized constant Resque になる
    # context 'POST /users/password' do
    #   before { create(:user) }
    #   it 'should be valid' do
    #     post '/users/password', user: { email: 'username+1@basicinc.jp', password: 'password' }
    #     expect(response.body).to eq(200)
    #   end
    # end
  end
end
