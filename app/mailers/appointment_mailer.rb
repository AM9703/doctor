class AppointmentMailer < ApplicationMailer
  default from: 'notifications@example.com'
  def send_mail(patient_email,doctor_email)
    @patient_email = patient_email
    @doctor_email = doctor_email
    mail(to: @doctor_email, subject: 'Welcome to My Awesome Site')
  end
	
end
