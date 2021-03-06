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
      flash[:success] = "Prescription send!"
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @prescription = Appointment.find_by(id: params[:id]).prescription
    if @prescription.present?
      @prescription = Prescription.find_by(id: @prescription)
      @appointment_id = @prescription.appointment_id
    else
      redirect_to root_path
    end
  end

  def update
    @prescription = Prescription.find_by(id: params[:id])
    if @prescription.update(prescription_params)
      flash[:success] = "Prescription update!"
      redirect_to root_path(@prescription)
    else
      render :edit
    end
  end

  def show
    @prescription = Appointment.find_by(id: params[:id]).prescription
    @prescription = Prescription.find_by(id: @prescription)
  end

  private

  def prescription_params
    params.require(:prescription).permit(:appointment_id,:prescription)
  end

end
