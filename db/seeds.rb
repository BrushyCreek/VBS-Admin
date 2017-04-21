# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

zipcodes = [29671, 29640, 29642, 29657, 29630]
genders = ["male", "female"]
grade_ids = [0,1,2,3,4,5,6,7,8]
            
100.times do
  @lastname = Faker::Name.last_name
  t2 = 12.year.ago
  t1 = 2.year.ago
  Kid.create!(
    first_name: Faker::Name.first_name,
    last_name: @lastname,
    birthdate: rand(t2..t1),
    last_grade_id: grade_ids.sample,
    gender: genders.sample,
    address: Faker::Address.street_address,
    city: Faker::Address.city,
    state: "SC",
    zipcode: zipcodes.sample,
    parent_first_name: Faker::Name.first_name,
    parent_last_name: @lastname,
    parent_phone: [Faker::PhoneNumber.area_code,Faker::PhoneNumber.exchange_code,Faker::PhoneNumber.subscriber_number].join.to_i,
    parent_email: Faker::Internet.email,
    buddy_request: ["","","",Faker::Name.name].sample,
    allergies: Faker::Boolean.boolean)
end

    
