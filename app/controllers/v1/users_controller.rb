class V1::UsersController < V1::BaseController

	def show
		@user = current_user
	end

	def social
		current_user.update_social_url!(params[:type], params[:link])
	end

end