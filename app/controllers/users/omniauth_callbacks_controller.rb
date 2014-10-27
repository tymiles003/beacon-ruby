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

		if @user.persisted? # TODO: need to find out what persisted is about
			sign_in @user
			redirect_to "beacon://#{auth_type}/#{@user.authentication_token}"
		else 
			session["devise.#{auth_type}_data"] == request.env["omniauth.auth"]
			redirect_to "beacon://#{auth_type}/"
		end
	end

end