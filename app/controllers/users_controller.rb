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
        redirect_to new_patient_path(user_id: @user.id)
      else 
        redirect_to new_doctor_path(user_id: @user.id)
      end
    else
      render :new      
    end
  end

  def show
  	@user = User.find_by(id: params[:id])
    @current_user = current_user
    @rooms = Room.public_rooms
    @users = User.all_except(@current_user)
    @room = Room.new
    @message = Message.new
    @room_name = get_name(@user, @current_user)
    @single_room = Room.where(name: @room_name).first || Room.create_private_room([@user, @current_user], @room_name)
    @messages = @single_room.messages
    render "rooms/index"
  end

  def destroy    
  end

  private

  def get_name(user1, user2)
    users = [user1, user2].sort
    "private_#{users[0].id}_#{users[1].id}"
  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :role)
  end
end
