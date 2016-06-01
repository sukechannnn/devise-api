OmniAuth.config.mock_auth[:twitter] = OmniAuth::AuthHash.new(
  provider: 'twitter',
  uid: '123545',
  info: {
    nickname: 'exampleuser',
    name: 'example user',
  }
)
