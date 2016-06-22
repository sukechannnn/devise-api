RSpec.shared_context 'api request global before and after hooks' do
  before(:each) do
    Warden.test_mode!
  end

  after(:each) do
    Warden.test_reset!
  end
end

RSpec.shared_context 'api request authentication helper methods' do
  def sign_in(user)
    login_as(user, scope: :user)
  end

  def sign_out
    logout(:user)
  end
end

RSpec.shared_context 'decode json web token' do
  def decode_jwt(response)
    rsa_public = OpenSSL::PKey.read ENV['RSA_PUBLIC']
    JWT.decode JSON.parse(response.body)['token'], rsa_public, true, algorithm: 'RS256'
  end
end
