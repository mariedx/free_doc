class Doctor < ApplicationRecord
  has_many :appointments
  has_many :patients, through: :appointments
  belongs_to :city
  has_many :join_table_specialty
  has_many :specialties, through: :join_table_specialty
end
