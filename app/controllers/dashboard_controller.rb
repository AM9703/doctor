class DashboardController < ApplicationController
  before_action :log_in_user, only: [:index]

  def index
    if @current_user.patient?
      @appointments = Appointment.all
      @doctors = Doctor.all
    else @current_user.doctor?
      @appointments = Appointment.all
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
