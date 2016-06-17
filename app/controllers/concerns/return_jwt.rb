module ReturnJwt
  extend ActiveSupport::Concern

  def return_jwt(resource)
    generate_token = GenerateToken.new
    generate_token.generate_jwt_token(resource.uid, resource.email1)
  end
end
