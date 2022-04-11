class Appointment < ApplicationRecord
  enum status: {pending: 'pending' , complete: 'complete', cancle: 'cancle'}
  attribute :status, :string, default: 'pending'  
  validates :date, :time,  presence: true
  belongs_to :doctor
  belongs_to :patient
  has_one :prescription
  
end
