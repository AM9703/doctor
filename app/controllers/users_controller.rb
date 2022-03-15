class UsersController < ApplicationController
	def index
		@users = User.all
	end

	def new
		@user = User.new
	end

	def create
    @user = User.new(user_params)
    if @user.save 
    	if @user.role == 'paiten'
    	   redirect_to paitent_path
    	 else @user.role == 'doctor'
    	 	redirect_to new_doctor_path
      end
    else
    	render :new    	
    end
	end


	private

	def user_params
		params.require(:user).permit(:email, :password,:role)
	end
end
