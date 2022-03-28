class PatientsController < ApplicationController
  before_action :find_patient, only: [:show, :edit, :update, :destroy]
  
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
      redirect_to new_session_path
    else
      render :new
    end
  end

  def show
  end

  def edit   	
  end

  def update
    @patient.update(patient_params)
    if @patient.update(patient_params) 
       redirect_to patient_path(@patient)  	
    else
        render :edit	
    end
  end

  def destroy
    @patient.destroy
    redirect_to patients_path
  end
      

  private

  def patient_params
    params.require(:patient).permit(:name, :age, :gender ,:user_id)
  end

  def find_patient
  	@patient = Patient.find_by(id: params[:id])  	
  end

end
