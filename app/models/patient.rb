class Patient < ApplicationRecord
	validates :name, :age,  presence: true
	enum gender: [:male, :female, :other]
end
