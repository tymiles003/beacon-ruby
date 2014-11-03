class SocialProfileController < ApplicationController

	def create
		@profile = SocialProfile.new(social_profile_params)
		@profile.user = current_user
		@profile.save!
	end

	def update
		@profile = SocialProfile.find(params[:id])
		raise ActiveRecord::RecordNotFound if @profile.nil?
		@profile.update_attributes(params[:social_profile])
	end

	def destroy
	end

	protected

	def social_profile_params
		params.require(:social_profile).permit(:url)
	end

end