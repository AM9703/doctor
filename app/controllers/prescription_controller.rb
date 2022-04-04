class PrescriptionController < ApplicationController
  def index
    @prescription = Prescription.all  
  end

  def new
    @appointment_id = params[:appointment_id]
    @prescription = Prescription.new  
  end
    
  def create
    @prescription = Prescription.new(prescription_params)
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
    params.require(:prescription).permit(:appointment_id,:prescription)
  end

end
