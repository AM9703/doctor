class SendMailWorker 
  include Sidekiq::Worker
  def perform(patient_email,doctor_email)
  	AppointmentMailer.send_mail(patient_email,doctor_email).deliver_now
  end
end