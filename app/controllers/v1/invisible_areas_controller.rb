class V1::InvisibleAreasController < ApplicationController

	def create
		@invisible_area = InvisibleArea.create!(invisible_area_params)
		current_user.invisible_areas << @invisible_area
		current_user.save!
		render :show
	end

	def update
		@invisible_area = InvisibleArea.find(params[:id])
		@invisible_area.update_attributes!(invisible_area_params)
		render :show
	end

	def destroy
		invisible_area = InvisibleArea.find(params[:id])
		invisible_area.destroy!
		render status: 204, nothing: true
	end

	protected 

	def invisible_area_params
		params.require(:invisible_area).permit(:name, :latitude, :longitude, :location, :range)
	end

end