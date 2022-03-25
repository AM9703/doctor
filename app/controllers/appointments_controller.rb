class AppointmentsController < ApplicationController
  before_action :app_find, only: [:show , :update ]
  def index
   @appointments = Appointment.all
   @doctors = Doctor.all
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
      # @patient.appointments.create(appointment_params)
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

  def destroy
    # binding.pry
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
