OmniAuth.config.mock_auth[:twitter] = OmniAuth::AuthHash.new(
  provider: 'twitter',
  uid: 'twitter12345',
  info: {
    nickname: 'exampleuser',
    name: 'example user',
  }
)

OmniAuth.config.mock_auth[:facebook] = OmniAuth::AuthHash.new(
  provider: 'facebook',
  uid: 'facebook12345',
  info: {
    nickname: 'exampleuser',
    name: 'example user',
  }
)

OmniAuth.config.mock_auth[:yahoojp] = OmniAuth::AuthHash.new(
  provider: 'yahoojp',
  uid: 'yahoojp12345',
  info: {
    nickname: 'exampleuser',
    name: 'example user',
  }
)
