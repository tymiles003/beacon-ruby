class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

	def facebook
		complete_auth("facebook")
	end

	def twitter
		complete_auth("twitter")
	end

	def instagram
		complete_auth("instgram")
	end

	def linkedin
		complete_auth("linkedin")
	end

	def tumblr
		complete_auth("tumblr")
	end

	protected 

	def complete_auth(auth_type)
		@user = User.from_omniauth(request.env["omniauth.auth"], auth_type)
		sign_in @user
		redirect_to "beacon://#{auth_type}/" 
	end

end