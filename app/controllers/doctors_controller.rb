class DoctorsController < ApplicationController
  before_action :find_doctor, only: [:show, :edit, :update, :destroy]

  def index
    @doctors = Doctor.all
    @appointments = Appointment.all
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
    @doctor.update(doctor_param)
    redirect_to doctor_path(@doctor)
  end

  def destroy    
    @doctor.destroy
    flash[:success] = "The doctor  was successfully destroyed."
    redirect_to new_user_path
  end
      

  private

    def doctor_param
     params.require(:doctor).permit(:name, :specialization, :fees, :start_time, :end_time,:user_id)
    end

    def find_doctor
     @doctor = Doctor.find_by(id: params[:id]) 
    end
end
