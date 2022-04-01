class SendMailWorker 
  include Sidekiq::Worker
  def perform(patient_email,doctor_email,patient)
  	AppointmentMailer.send_mail(patient_email,doctor_email,patient).deliver_now
  end
end