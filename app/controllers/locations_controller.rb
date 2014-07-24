class LocationsController < ApplicationController
	
	def index
		@locations = Location.order('created_at DESC')
	end

	def show
		@location = Location.find(params[:id])
	rescue ActiveRecord::RecordNotFound
 			render status: 404
	end
end
