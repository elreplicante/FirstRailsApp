require 'faker'
Location.destroy_all
Visit.destroy_all

20.times do |n|
	location = Location.create(
		name: Faker::Company.catch_phrase, 
		street: Faker::Address.street_address, 
		city: Faker::Address.city, 
		zip_code: Faker::Address.zip_code, 
		country: Faker::Address.country,
		description: Faker::Lorem.sentence)
end

40.times do |n|
		visit = Visit.create(
			location: Location.all.sample(1)
			user_name: Faker::Internet.user_name
		)
end