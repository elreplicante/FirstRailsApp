require 'rails_helper'

RSpec.describe Location, :type => :model do
  describe "Test returning iron_find by id" do
		it "iron_find id = 1" do
			expect(Location.iron_find(1)).to eq(Location.where(id: 1).first)
		end
	end
end
