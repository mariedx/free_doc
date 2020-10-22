class Specialty < ApplicationRecord
  has_many :join_table_specialty
  has_many :doctors, through: :join_table_specialty
end
