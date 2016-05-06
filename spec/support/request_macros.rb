module RequestMacros
  extend ActiveSupport::Concern

  module ClassMethods

    def user_login
      context 'POST /users/sign_in' do
        before { create(:user) }
        it 'will be login' do
          post '/users/sign_in', user: { email: 'username+1@basicinc.jp', password: 'password',
                                         remember_me: 0 }
        end
      end
    end
  end
end
