OmniAuth.config.mock_auth[:twitter] = OmniAuth::AuthHash.new(
  provider: 'twitter',
  uid: '12345',
  info: {
    nickname: 'exampleuser',
    name: 'example user',
  }
)
