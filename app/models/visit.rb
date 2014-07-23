class Visit < ActiveRecord::Base
	belongs_to :location

	validates :from_date, presence: true
	validates :to_date, presence: true
	validates :user_name, format: {with: /\A[a-zA-Z0-9]*\z/}
	validates :location_id, presence: true
	validate :from_date_it_before_to_date

	def from_date_it_before_to_date
		if from_date.to_i > to_date.to_i
			errors.add(:from_date, 'Your from date can not be bigger than your to_date')
		end
	end
end
