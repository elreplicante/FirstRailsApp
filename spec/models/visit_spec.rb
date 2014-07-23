require 'rails_helper'
require 'date'

RSpec.describe Visit, :type => :model do
  describe "Testing visit validations" do
  	before :each do
  		@location = Location.new
  		@location.name = 'City'
  		@location.city = 'Murcia'
  		@visit = Visit.new
  		@visit.user_name = 'ElenaTorro'
  		@visit.location_id = 1
  		@visit.from_date = DateTime.now
  		@visit.to_date = DateTime.now + 1.day
  	end
  	it "Test if the visit is valid" do
  		expect(@visit.valid?).to eq(true)
  	end
  end
end
