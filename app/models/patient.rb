class Patient < ApplicationRecord
  validates :name, :age,  presence: true
  enum gender: {male: 'male', female: 'female', other: 'other'}

  has_many :appointments
  has_many :doctors, through: :appointments
end