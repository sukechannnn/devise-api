OmniAuth.config.mock_auth[:twitter] = OmniAuth::AuthHash.new(
  provider: 'twitter',
  uid: '12345',
  info: {
    nickname: 'exampleuser',
    name: 'example user',
  }
)

OmniAuth.config.mock_auth[:facebook] = OmniAuth::AuthHash.new(
  provider: 'facebook',
  uid: '12345',
  info: {
    nickname: 'exampleuser',
    name: 'example user',
  }
)

OmniAuth.config.mock_auth[:yahoojp] = OmniAuth::AuthHash.new(
  provider: 'yahoojp',
  uid: '12345',
  info: {
    nickname: 'exampleuser',
    name: 'example user',
  }
)
