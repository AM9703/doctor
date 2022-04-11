class DoctorsController < ApplicationController
  before_action :find_doctor, only: [:show, :edit, :update, :destroy]
  
  def index
    @doctors = Doctor.all  
  end

  def new
    @user_id = params[:user_id]
    @doctor = Doctor.new
  end

  def create
    @doctor = Doctor.new(doctor_param)
    if @doctor.save
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
  end

  def destroy    
  end      

  private

  def doctor_param
    params.require(:doctor).permit(:name, :specialization, :fees, :start_time, :end_time,:user_id, :profile_image)
  end

  def find_doctor
    @doctor = Doctor.find_by(id: params[:id]) 
  end
end
