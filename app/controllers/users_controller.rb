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
      if @user.patient?        
        redirect_to new_patient_path(user_id: @user.id)
      else @user.doctor?
        redirect_to new_doctor_path(user_id: @user.id)
      end
    else
      render :new      
    end
  end

  def show
  	@user = User.find_by(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:email, :password,:role)
  end
end
