class DashboardController < ApplicationController
  before_action :log_in_user, only: [:index]
  

  def index
    # binding.pry
    if @current_user.patient? 
      patient = Patient.find_by(user_id: @current_user)
      if patient.appointments.present?
        @appointments=patient.appointments
        @doctors = Doctor.all        
      else
        @doctors = Doctor.all
        @app_no_records = "No-record"
      end
    elsif @current_user.doctor?   
      doctor = Doctor.find_by(user_id: @current_user)
      if doctor.appointments.present?
        @appointments=doctor.appointments
        @patient = Patient.all
      else
        @app_no_records = "No-record"
      end
    else
      redirect_to new_session_path
    end
  end

  private

  def log_in_user
    unless logged_in?
      flash[:danger] = "Please log in."
      store_location
      flash[:danger] = "Please log in."
      redirect_to new_session_path
    end
  end

end
