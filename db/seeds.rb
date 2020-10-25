require 'faker'

# Patient.destroy_all
# Doctor.destroy_all
# Appointment.destroy_all
# City.destroy_all

20.times do
    City.create!(city: Faker::Address.name)
end

15.times do 
  Specialty.create!(
    specialty: ["Anatomo-pathologie", "Anesthésie-réanimation", "Biologie médicale", "Cardiologie", "Chirurgie", "Psychiatrie adulte", "Psychiatrie infanto-juvénile", "Radiothérapie", "Radiologie", "Rhumatologie", "Stomatologie", "Urologie"].sample
  )
end

100.times do
  Patient.create!(
    first_name: Faker::Name.first_name, 
    last_name: Faker::Name.last_name,
    city: City.all.sample
    )
end

20.times do
  Doctor.create!(
    first_name: Faker::Name.first_name, 
    last_name: Faker::Name.last_name, 
    zip_code: Faker::Address.zip_code,
    city: City.all.sample
    )
end

200.times do
    doc = Doctor.all.sample
    Appointment.create!(
        date: Faker::Date.forward(days: 365), 
        patient: Patient.all.sample, 
        doctor: doc,
        city: doc.city
    )
end

Doctor.all.each do |doctor|
    JoinTableSpecialty.create(
        doctor: doctor, 
        specialty: Specialty.all.sample
        )
end

10.times do 
    city = City.create(city: Faker::Nation.capital_city)
    patient = Patient.create(first_name: Faker::Superhero.prefix , last_name: Faker::Superhero.name, city: city )
    doctor = Doctor.create(first_name: Faker::Superhero.prefix , last_name: Faker::Games::StreetFighter.character, zip_code:Faker::Address.zip_code, city: city)
    appointment = Appointment.create(doctor: doctor, patient: patient, date: Faker::Date.between(from: '2020-09-23', to: '2020-09-26'),city: city)
    specialty = Specialty.create(specialty: Faker::Job.title)
    joinspedoc = JoinTableSpecialty.create(doctor: doctor, specialty: specialty)
end