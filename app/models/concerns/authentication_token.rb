module AuthenticationToken
  def generate_authentication_token
    #code
  end

  def ensure_authentication_token
    self.authentication_token || generate_authentication_token
  end

  def delete_authentication_token
    self.update(authentication_token: nil)
  end
end
