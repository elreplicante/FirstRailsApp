class Location < ActiveRecord::Base
	def self.iron_find(id)
		self.where(id: id).first
	end

	def info
		self.to_json
	end
end
