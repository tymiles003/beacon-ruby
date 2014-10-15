class V1::UsersController < V1::BaseController

	def show
		@user = User.find(params[:id])
	end

	def social
		current_user.update_social_url!(params[:type], params[:link])
	end

end