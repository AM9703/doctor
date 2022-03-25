class Appointment < ApplicationRecord
	# enum status: {pending: 'pending' , complete: 'complete', cancle: 'cancle'}
	validates :date, :time,  presence: true
	belongs_to :doctor
	belongs_to :patient
	STATUSES= %w[pending complete cancle]

	def pending!
    update_attribute :status, "pending"
  end

  def complete!
    update_attribute :status, "complete"
  end

  def cancle!
    update_attribute :status, "cancle"
  end
end
