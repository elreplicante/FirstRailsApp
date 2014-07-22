class LocationsController < ApplicationController
	def index
		@locations = Location.order('created_at DESC').limit(10)
	end

	def show
		@show_location = Location.find(params[:id])
	rescue ActiveRecord::RecordNotFound
 			render status: 404
	end
end
