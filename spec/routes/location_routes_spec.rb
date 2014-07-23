require 'rails_helper'

RSpec.describe "Routes", :type => :routing do
  describe "Testing locations " do
		it "routes to locations index" do
			expect(get: "/locations").to route_to("locations#index")
		end

		it "routes to location with id" do
			expect(get: "/locations/999").to route_to(controller: "locations", action: "show", id: "999")
		end
	end
end