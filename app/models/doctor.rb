class Doctor < ApplicationRecord
	validates :name, :specialization, :fees, :start_time, :end_time,  presence: true
end
