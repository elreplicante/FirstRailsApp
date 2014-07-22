class LocationsController < ApplicationController
	def index
		@locations = Location.order('created_at DESC').limit(10)
	end

	# def show
		
	# end
end
