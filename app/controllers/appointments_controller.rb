class AppointmentsController < ApplicationController
  before_action :app_find, only: [:show , :update]
  
  def index
    if @current_user.patient?
      patient = Patient.find_by(user_id: @current_user)
      @appointments=patient.appointments
      @doctors = Doctor.all
    else 
      doctor = Doctor.find_by(user_id: @current_user)
      if @appointments.present?
        @appointments=doctor.appointments
      else
        # binding.pry
        @app_no_records = "No-record"
      end
    end
  end

  def new 
    @doctor_id = params[:doctor_id]
    @appointment = Appointment.new
  end

  def create
    if @current_user.patient?
      @patient = Patient.find_by_user_id @current_user.id
      @appointment = Appointment.new(appointment_params)
      @appointment.patient_id = @patient.id
      if @appointment.save
        redirect_to appointments_path
      else
        render :new
      end
    end
  end

  def show
    
  end

  def update
    if @appointment.update(appointment_params)
      redirect_to root_path
    else
      render :update
    end
  end

  def status_update
    @appointment = Appointment.find_by(id: params[:appointment][:id])
    if params[:appointment][:status] == "complete"
     @appointment.complete!
      redirect_to root_path
    else 
      @appointment.cancle!
      redirect_to root_path
    end
  end

  def destroy
    @appointment = Appointment.find_by(id: params[:id])
    @appointment.destroy
    redirect_to root_path    
  end

  private

  def appointment_params
    params.require(:appointment).permit(:date, :time, :doctor_id, :status)
  end
 
  def app_find
    @appointment = Appointment.find_by(id: params[:id])
  end

end
