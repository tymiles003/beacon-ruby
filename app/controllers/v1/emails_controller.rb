class V1::EmailsController < V1::BaseController

	skip_before_filter :require_no_authentication
  skip_before_filter :verify_authenticity_token,
                     :if => Proc.new { |c| c.request.format == 'application/json' }
  skip_before_filter :authenticate_user!

	def new
		unless params[:email] 
			render status: 403 and return
		end
		if User.find_by_email(params[:email].downcase).nil?
			render status: 403
		end
	end

end