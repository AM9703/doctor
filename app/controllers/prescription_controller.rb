class PrescriptionController < ApplicationController

  def index
    @prescription = Prescription.all  
  end

  def new
    @patient_id = params[:patient_id]
    @appointment_id = params[:appointment_id]
    @prescription = Prescription.new  
  end
    
  def create
    @doctor_id = Doctor.find_by(user_id: current_user.id)
    @prescription = Prescription.new((prescription_params).merge(doctor_id: @doctor_id.id))
    if @prescription.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @prescription = Appointment.find_by(id: params[:id]).prescriptions
    @prescription = Prescription.find_by(id: @prescription)
  end

  private

  def prescription_params
    params.require(:prescription).permit(:patient_id, :appointment_id,:prescription)
  end
end
