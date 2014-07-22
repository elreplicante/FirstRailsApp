class Location < ActiveRecord::Base
	has_many :visits

	def self.iron_find(id)
		self.where(id: id).first
	end

	def info
		self.to_json
	end
end
