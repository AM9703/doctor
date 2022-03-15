class DoctorsController < ApplicationController

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
      binding.pry 
      redirect_to doctors_path
    else
      render :new
    end
  end

  def show
    binding.pry
    @doctor = Doctor.find_by(params[:id])
  end

  private

    def doctor_param
     params.require(:doctor).permit(:name, :specialization, :fees, :start_time, :end_time)
    end
end
