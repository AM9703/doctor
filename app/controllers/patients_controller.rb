class PatientsController < ApplicationController
  def index
    @patients = Patient.all
  end

  def new
    @user_id = params[:user_id]
    @patient = Patient.new
  end

  def create
    @patient = Patient.new(patient_params)
    if @patient.save
      redirect_to patients_path
    else
      render :new
    end
  end

  def show
    @patient = Patient.find_by(params[:id])
  end

  private

  def patient_params
    params.require(:patient).permit(:name, :gender, :age ,:user_id)
  end

end
