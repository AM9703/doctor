class Doctor < ApplicationRecord
	validates :name, :specialization, :fees,:start_time, :end_time,  presence: true
	has_many :appointments
	has_many :patients, through: :appointments
end
