class UsersController < ApplicationController
  before_action :logged_in_user, only: [:show]

  def index
    @users = User.all
  end

  def new  
    @user = User.new
  end

  def create
    # binding.pry
    @user = User.new(user_params)
    if @user.save     
      if @user.password == @user.password_confirmation
        if @user.patient?        
          redirect_to new_patient_path(user_id: @user.id)
        else @user.doctor?
          redirect_to new_doctor_path(user_id: @user.id)
        end
      else
        render :new      
      end
    else   
    flash[:success] = "The doctor  was successfully destroyed."     
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
