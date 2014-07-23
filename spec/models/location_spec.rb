require 'rails_helper'

RSpec.describe Location, :type => :model do
  describe "Test returning iron_find by id" do
		it "iron_find id = 1" do
			expect(Location.iron_find(1)).to eq(Location.where(id: 1).first)
		end
	end

  describe "Testing validations" do
  		it "Name should be present" do
  			@location = Location.new
  			@location.city = 'Murcia'
  			expect(@location.valid?).to eq(false)
  		end

  		it "City should be present" do
  			@location = Location.new
  			@location.name = 'City'
  			@location.city = 'Murcia'
  			expect(@location.valid?).to eq(true)
  		end

  		it "Lentgh name should be smaller than 30 characters" do
  			@location = Location.new
  			@location.name = 'I'*35
  			@location.city = 'Murcia'
  			expect(@location.valid?).to eq(false)
  		end

  		it "Name should inlude only alphanumeric characters" do
  			@location = Location.new
  			@location.name = "**?=·$_"
  			@location.city = 'Murcia'
  			expect(@location.valid?).to eq(false)
  		end

  		it "Name should inlude only alphanumeric characters" do
  			@location = Location.new
  			@location.name = "AAAB123"
  			@location.city = 'Murcia'
  			expect(@location.valid?).to eq(true)
  		end
  end
end
