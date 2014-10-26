OmniAuth.config.test_mode = Rails.env.test?
OmniAuth.config.mock_auth[:facebook] = OmniAuth::AuthHash.new({
	provider: 'facebook',
	uid: '12345',
	email: 'jsksma2@gmail.com'
})