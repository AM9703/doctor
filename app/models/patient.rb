class Patient < ApplicationRecord
  validates :name, :age,  presence: true
  enum gender: {male: 'male', female: 'female', other: 'other'}
end