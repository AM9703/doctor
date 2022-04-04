class Prescription < ApplicationRecord
  belongs_to :appointment
  validates :prescription,   presence: true
end
