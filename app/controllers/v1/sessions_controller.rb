class V1::SessionsController < Devise::SessionsController
  skip_before_filter :require_no_authentication
  skip_before_filter :verify_authenticity_token,
                     :if => Proc.new { |c| c.request.format == 'application/json' }
  skip_before_filter :authenticate_user!

  def create
    email = params[:email]
    password = params[:password]
    if email.nil? || password.nil?
      render status: 400,
      json: {
        error: "An email and password is required."
      } and return
    end

    @user = User.find_by_email(email.downcase)
    raise ActiveRecord::RecordNotFound if @user.nil?

    if !@user.valid_password?(password)
      render status: 401,
      json: {
        error: I18n.t("devise.failure.not_found_in_database")
      }
    else 
      sign_in @user
    end
  end

  def destroy
    current_user.reset_api_key
    sign_out current_user
    render :status => 200,
           :json => { :success => true,
                      :info => "Logged out",
                      :data => {} }
  end

end
