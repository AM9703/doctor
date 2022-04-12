class AppointmentsController < ApplicationController

  def index
    if @current_user.patient?
      patient = Patient.find_by(user_id: @current_user)
      @appointments = patient.appointments
      @doctors = Doctor.all      
    else 
      doctor = Doctor.find_by(user_id: @current_user)
      @appointments = doctor.appointments
    end
  end

  def new 
  end

    
  def create
    if @current_user.patient?
      patient = Patient.find_by_user_id @current_user.id
      @appointment = Appointment.new(doctor_id: params[:doctor_id], patient_id: patient.id)
      @doctor = Doctor.find_by(id: @appointment.doctor_id)
      appointment = @doctor.appointments.last
      @appointment.date = appointment.date + 15.minutes
      doctor_user = User.find_by(id: @doctor.user_id)
      @patient_email = @current_user.email
      @doctor_email = doctor_user.email 
      if @appointment.save
        flash[:success] = "Appointment created!"
        SendMailWorker.perform_async(@patient_email,@doctor_email,@patient)
        redirect_to appointments_path
      else
        flash[:danger] = "Appointment not created"
        render :new
      end     
    end
  end

  def show    
  end

  def edit 

  end

  def update  
  end

  def status_update
    @appointment = Appointment.find_by(id: params[:appointment][:id])
    if params[:appointment][:status] == "complete"
      @patient_id = @appointment.patient_id
      @appointment.complete!
      flash[:success] = "Appointment complete!"
     redirect_to :controller => 'prescription', :action => 'new', appointment_id: @appointment.id 
    else 
      @appointment.cancle!
      flash[:success] = "Appointment cancle!"
      redirect_to root_path
    end
  end

  def destroy  
  end

  private

  def appointment_params
    params.require(:appointment).permit(:date, :doctor_id, :status)
  end 

end

