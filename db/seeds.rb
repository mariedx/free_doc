# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require 'faker'

specialty = Specialty.create(
  specialty: ["Generaliste", "Gynecologue", "Cardiologue", "Naturopathe", "Dermatologue", "Osteopathe"].split
  )
50.times do
  city = City.create!(
    city: Faker::Address.city
  )
  doctor = Doctor.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    zip_code: Faker::Address.zip.to_s,
    city: city,
  )
  patient = Patient.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    city: city
  )
  appointment = Appointment.create!(
    doctor: doctor,
    patient: patient,
    date: Faker::Date.between(from: "2020-01-01", to:"2021-01-01"),
    city: city
  )
end