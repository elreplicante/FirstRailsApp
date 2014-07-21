class Location < ActiveRecord::Base
	def self.iron_find(id)
		self.where(id: id).first
	end
end
