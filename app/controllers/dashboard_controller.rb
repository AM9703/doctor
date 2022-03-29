class DashboardController < ApplicationController
  before_action :log_in_user, only: [:index]
  

  def index
    if @current_user.patient? 
      # binding.pry
      patient = Patient.find_by(user_id: @current_user)
      if patient.appointments.present?
        @appointments=patient.appointments
        @doctors = Doctor.all        
      else
        # binding.pry
        @doctors = Doctor.all
        @app_no_records = "No-record"
      end
    else   
      doctor = Doctor.find_by(user_id: @current_user)
      if doctor.appointments.present?
        @appointments=doctor.appointments
      else
        # binding.pry
        @app_no_records = "No-record"
      end
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
