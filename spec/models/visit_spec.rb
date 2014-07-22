require 'rails_helper'

RSpec.describe Visit, :type => :model do
  describe "Testing new table visit" do
  	@location = Location.create!(name: 'Murcia', description: 'Hot City')
    it "A location with one visit" do

    end
  end
end
