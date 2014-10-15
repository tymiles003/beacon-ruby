class V1::EmailsController < V1::BaseController

	skip_before_filter :require_no_authentication
  skip_before_filter :verify_authenticity_token,
                     :if => Proc.new { |c| c.request.format == 'application/json' }
  skip_before_filter :authenticate_user!

	def new
		raise ActiveRecord::RecordNotFound if !params[:email]
		render json: {
			state: !User.find_by_email(params[:email]).nil?
		}
	end

end