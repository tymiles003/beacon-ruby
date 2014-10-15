class V1::BaseController < ApplicationController
	include Devise::Controllers::Helpers
  helper_method :current_user
  helper_method :authenticate_user!

  before_action :authenticate_user!

	def api_version
		'v1'
	end

end