class UsersController < ApplicationController
  before_action :logged_in_user, only: [:show]

  def index
    @users = User.all
  end

  def new  
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save     
      if @user.password == @user.password_confirmation
        if @user.patient?        
          flash[:success] = 'paitent created'
          redirect_to new_patient_path(user_id: @user.id)
        else @user.doctor?
          flash[:success] = 'doctor created'
          redirect_to new_doctor_path(user_id: @user.id)
        end
      else
        render :new      
      end
    else   
    flash.now[:error] = "Could not save user"     
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
