require 'jwt'

class GenerateToken
  def generate_jwt_token(uid, email)
    rsa_private = OpenSSL::PKey.read ENV['RSA_PRIVATE']
    expiration_days = 180
    payload = {
      uid: uid,
      email: email,
      expiration: expiration_days,
    }
    JWT.encode payload, rsa_private, 'RS256'
  end
end
