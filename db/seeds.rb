# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require 'faker'


# 50.times do

#   city = City.create!(
#     city: Faker::Address.city
#   )
#   doctor = Doctor.create!(
#     first_name: Faker::Name.first_name,
#     last_name: Faker::Name.last_name,
#     zip_code: Faker::Address.zip.to_s,
#     city: City.all.sample,
#     speciality: speciality_list.sample
#   )
#   patient = Patient.create!(
#     first_name: Faker::Name.first_name,
#     last_name: Faker::Name.last_name,
#     city: city
#   )
#   appointment = Appointment.create!(
#     doctor: doctor,
#     patient: patient,
#     date: Faker::Date.between(from: "2020-01-01", to:"2021-01-01"),
#     city: city
#   )
# end

15.times do 
  Speciality.create!(
    speciality: ["Anatomo-pathologie", "Anesthésie-réanimation", "Biologie médicale", "Cardiologie", "Chirurgie", "Psychiatrie adulte", "Psychiatrie infanto-juvénile", "Radiothérapie", "Radiologie", "Rhumatologie", "Stomatologie", "Urologie"].sample
  )
end

100.times do
  Patient.create!(
    first_name: Faker::Name.first_name, 
    last_name: Faker::Name.last_name
    )
end

20.times do
  Doctor.create!(
    first_name: Faker::Name.first_name, 
    last_name: Faker::Name.last_name, 
    specialty: Speciality.all.sample,
    zip_code: Faker::Address.zip_code
    )
end

200.times do
  Appointment.create!(
    date: Faker::Date.forward(days: 365), 
    patient_id: rand(1..100), 
    doctor_id: rand(1..20)
    )
end