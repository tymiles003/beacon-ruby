class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
	
	def facebook
		complete_auth("facebook")
	end

	def twitter
		complete_auth("twitter")
	end

	def instagram
		complete_auth("instagram")
	end

	def linkedin
		complete_auth("linkedin")
	end

	def tumblr
		complete_auth("tumblr")
	end

	def failure
		redirect_to "beacon://user/auth/failure"
	end

	protected 

	def success(type)
		redirect_to "beacon://user/auth/#{type}"
	end

	def complete_auth(type)
		params = request.env["omniauth.params"]
		id = params["id"]
		current_user = User.find(id)

		auth = request.env["omniauth.auth"]
		current_user.add_omniauth(auth, type)
		current_user.save!
		success type
	end

end