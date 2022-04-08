class Patient < ApplicationRecord
  validates :name, format: { without: /[0-9]/, message: "does not allow numbers" }
  validates :name, :age,  presence: true 
  enum gender: {male: 'male', female: 'female', other: 'other'}
  has_many :appointments
  has_many :doctors, through: :appointments
end