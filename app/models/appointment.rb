class Appointment < ApplicationRecord
  enum status: {pending: 'pending' , complete: 'complete', cancle: 'cancle'}
  validates :date, :time,  presence: true
  belongs_to :doctor
  belongs_to :patient
  has_many :prescriptions
  attribute :status, :string, default: 'pending'  
  
end
