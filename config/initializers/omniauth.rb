OmniAuth.config.test_mode = Rails.env.test?

if Rails.env.test?
	strategies = ['facebook', 'twitter', 'instagram', 'linkedin']
	for s in strategies 
		OmniAuth.config.mock_auth[:"#{s}"] = OmniAuth::AuthHash.new({
			provider: s,
			uid: '12345',
			info: {
				urls: { s.titleize => "http://google.com" }
			}
		})
	end

	OmniAuth.config.mock_auth[:tumblr] = OmniAuth::AuthHash.new({
		provider: 'tumblr',
		uid: '12345',
		info: {
			blogs: [
				{url: "http://tumblr.com"}
			]
		}
	})
end