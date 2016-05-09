class GenerateToken
  def generate_jwt_token
    #code
  end

  def ensure_jwt_token
    self.jwt_token || generate_jwt_token
  end

  def delete_jwt_token
    self.update(jwt_token: nil)
  end
end
