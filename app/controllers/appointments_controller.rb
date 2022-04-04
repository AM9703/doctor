class AppointmentsController < ApplicationController
  before_action :app_find, only: [:show , :update]
  
  def index
    if @current_user.patient?
      patient = Patient.find_by(user_id: @current_user)
      if @appointments.present?
        @appointments=patient.appointments
        @doctors = Doctor.all        
      else
        @doctors = Doctor.all
        @patient = Patient.all
        @app_no_records = "No-record"
      end
    else 
      doctor = Doctor.find_by(user_id: @current_user)
      if @appointments.present?
        @appointments=doctor.appointments
        @patient = Patient.all
      else
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
      @patient_email = @current_user.email
      doctor_id = @appointment.doctor_id
      doctor = Doctor.find_by(id: doctor_id)
      doctor_user_id = doctor.user_id
      doctor_user = User.find_by(id: doctor_user_id)
      @doctor_email = doctor_user.email
      if @appointment.save
        SendMailWorker.perform_async(@patient_email,@doctor_email,@patient)
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
      @patient_id = @appointment.patient_id
      @appointment.complete!
     redirect_to :controller => 'prescription', :action => 'new', appointment_id: @appointment.id 
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
