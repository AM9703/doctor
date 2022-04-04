class UsersController < ApplicationController

  def index
    @users = User.all
    redirect_to root_path
  end

  def new  
    @user = User.new
  end

  def create  
    @user = User.new(user_params)
    if @user.save  
      if @user.patient?        
        flash[:success] = 'paitent created'
        redirect_to new_patient_path(user_id: @user.id)
      else 
        flash[:success] = 'doctor created'
        redirect_to new_doctor_path(user_id: @user.id)
      end
    else
      render :new      
    end
  end

  def show
  	@user = User.find_by(id: params[:id])
  end

  def destroy
    
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :role)
  end
end
