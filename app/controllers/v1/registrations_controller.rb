class V1::RegistrationsController < Devise::RegistrationsController
  skip_before_filter :verify_authenticity_token,
                     :if => Proc.new { |c| c.request.format == 'application/json' }

  def create
    @user = User.create!(user_params)
    sign_in @user
  end

  protected

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :remember_me)
  end
end
