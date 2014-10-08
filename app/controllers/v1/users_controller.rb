class V1::UsersController < V1::BaseController

	def show
		@user = User.find(params[:id])
	end

end