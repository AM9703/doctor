class DoctorsController < ApplicationController

	def index
		@doctor = Doctor.all
	end

	def new
		@doctor = Doctor.new
	end

	def create
		@doctor = Doctor.new(doctor_param)
		if @doctor.save
			redirect_to doctor_path
		else
			
		end
	end

	private

	  def doctor_param
	   params.require(:doctor).permit(:name, :specialization, :fees, :start_time, :end_time)
	  end
end
