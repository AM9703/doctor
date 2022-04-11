class DashboardController < ApplicationController
  before_action :log_in_user, only: [:index]  

  def index
    # binding.pry
    if @current_user.patient?
      patient = Patient.find_by(user_id: @current_user)
      @appointments = patient.appointments
      @doctors = Doctor.all  
      @app_no_records = "No-record"    
    else 
      doctor = Doctor.find_by(user_id: @current_user)
      @appointments = doctor.appointments
      @app_no_records = "No-record"
    end
  end

  private

  def log_in_user
    unless logged_in?
      flash[:alert] = "Please log in."
      store_location
      flash[:alert] = "Please log in."
      redirect_to new_session_path
    end
  end

end
