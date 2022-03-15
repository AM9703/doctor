class PatientsController < ApplicationController
	def index

		@patient = Patient.all
	end

	def new
		@user_id = params[:user_id]
		@patient = Patient.new
	end

	def create

		@patient = Patient.new(patient_params)
		if @patient.save
			@user = User.find_by(id: params[:patient][:user_id])
      # @user.update(patient_id: @patient.id)

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
		params.require(:patient).permit(:name, :gender, :age)
	end

end
