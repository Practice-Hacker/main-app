OmniAuth.config.test_mode = true
OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new({
  provider: 'google_oauth2',
  uid: '12345678',
  info: {
    username: 'Tony Stark',
    email: 'tony@stark.com'
  },
  credentials: {
    token: 'token',
    refresh_token: 'refresh_token'
  }
})

# OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new({
#   provider: 'google_oauth2',
#   uid: '12345678',
#   info: {
#     email: 'noheadned@stark.com',
#   },
#   credentials: {
#     access_token: "token",
#     refresh_token: "refresh_token"
#   }
# })
