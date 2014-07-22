require 'rails_helper'

RSpec.describe LocationsController, :type => :controller do
	describe "GET #show:id" do
		before (:each) do
		  	@location = Location.create!(name: 'Murcia', description: 'Hot City')
		    get :show, id: @location.id
		end
		it "responds successfully with an HTTP 200 status code" do
      		expect(response).to be_success
      		expect(response).to have_http_status(200)
		end

		it "render show template" do
	      expect(response).to render_template :show
		end
	end
end