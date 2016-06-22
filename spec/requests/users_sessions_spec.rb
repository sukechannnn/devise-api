require 'rails_helper'

RSpec.describe 'Users Sessions', type: :request do
  include_context 'api request authentication helper methods'
  include_context 'api request global before and after hooks'
  include_context 'decode json web token'

  let(:user_params) do
    { user: { email: 'username+1@basicinc.jp', password: 'password' } }
  end

  context 'POST /users/sign_in (ログイン)' do
    context '正しく入力したとき' do
      before { create(:user) }
      it 'should be valid' do
        post '/users/sign_in', user_params.deep_merge(user: { remember_me: 0 })
        expect(response.status).to eq 200
        session_data = decode_jwt response
        expect(session_data.first.deep_symbolize_keys[:email]).to eq user_params[:user][:email]
        expect(response).to match_response_schema('/users/sign_in')
      end
    end

    context 'already signed in' do
      before { create(:user) }
      it 'should be valid' do
        sign_in(User.first)
        post '/users/sign_in', user_params.deep_merge(user: { remember_me: 0 })
        expect(response.status).to eq 302
      end
    end

    context 'password is blank' do
      before { create(:user) }
      it 'should be invalid' do
        post '/users/sign_in', user: { email: 'incorrect@basicinc.jp', password: '', remember_me: 0 }
        expect(response.status).to eq 422
        expect(JSON.parse(response.body)['alert']).to eq I18n.t 'devise.failure.invalid'
        expect(flash[:alert]).to eq I18n.t 'devise.failure.invalid'
      end
    end

    context 'email is blank' do
      before { create(:user) }
      it 'should be invalid' do
        post '/users/sign_in', user: { email: '', password: 'password', remember_me: 0 }
        expect(response.status).to eq 422
        expect(JSON.parse(response.body)['alert']).to eq I18n.t 'devise.failure.invalid'
        expect(flash[:alert]).to eq I18n.t 'devise.failure.invalid'
      end
    end

    context 'incorrect email' do
      before { create(:user) }
      it 'should be invalid' do
        post '/users/sign_in', user: { email: 'incorrect@basicinc.jp', password: 'password', remember_me: 0 }
        expect(response.status).to eq 422
        expect(JSON.parse(response.body)['alert']).to eq I18n.t 'devise.failure.invalid'
        expect(flash[:alert]).to eq I18n.t 'devise.failure.invalid'
      end
    end

    context 'incorrect password' do
      before { create(:user) }
      it 'should be invalid' do
        post '/users/sign_in', user: { email: 'username+1@basicinc.jp', password: 'incorrect', remember_me: 0 }
        expect(response.status).to eq 422
        expect(JSON.parse(response.body)['alert']).to eq I18n.t 'devise.failure.invalid'
        expect(flash[:alert]).to eq I18n.t 'devise.failure.invalid'
      end
    end
  end

  context 'GET /users/sign_out (ログアウト)' do
    before { create(:user) }
    it 'should be valid' do
      sign_in(User.first)
      get '/users/sign_out'
      expect(response.status).to eq 200
      expect(JSON.parse(response.body)['token']).to eq ''
      expect(JSON.parse(response.body)['notice']).to eq I18n.t 'devise.sessions.signed_out'
      expect(flash[:notice]).to eq I18n.t 'devise.sessions.signed_out'
    end
  end
end
