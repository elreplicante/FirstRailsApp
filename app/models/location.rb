class Location < ActiveRecord::Base
	has_many :visits

	validates :name, presence: true, length: {maximum: 30}, format: {with: /\A[a-zA-Z0-9]*\z/}
	validates :city, presence: true

	def self.iron_find(id)
		self.where(id: id).first
	end

	def info
		self.to_json
	end
end
