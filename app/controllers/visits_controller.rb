class VisitsController < ApplicationController

	def new
		@location = Location.find(params[:location_id])
		@visit = @location.visits.new
	end

	def create
 		@location = Location.find(params[:location_id])
 		@visit = @location.visits.new visit_params

 		if @visit.save
 		flash[:notice] = "New visit created successfully"
 		redirect_to :controller => 'locations', :action => 'show', :id => @location.id
 		else
 			@errors = @visit.errors.full_messages
 			render 'new'
 		end #endif
	end #endcreate

	def edit
		@location = Location.find(params[:location_id])
		@visit = Visit.find(params[:id])
	end

	def update
		@location = Location.find(params[:location_id])
		@visit = Visit.find(params[:id])

		if @visit.update_attributes(visit_params)
 			redirect_to :controller => 'locations', :action => 'show', :id => @location.id
 		else
 			@errors = @visit.errors.full_messages
 			render 'edit'
 		end #endif

	end

	def destroy
		@location = Location.find(params[:location_id])
		@visit = Visit.find(params[:id])
		@visit.destroy
		flash[:notice] = "You deleted the visit successfully"
		redirect_to :controller => 'locations', :action => 'show', :id => @location.id
	end #enddestroy

	private
		def visit_params
			params.require(:visit).permit(:user_name, :from_date, :to_date)
		end

end
