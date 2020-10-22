require 'faker'

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