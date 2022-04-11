class RoomsController < ApplicationController

  def index
    @rooms = Room.public_rooms
    @users = User.all_except(@current_user)
    @room = Room.new  
    # if @current_user.patient?
    #   @users = Doctor.all
    # else
    #   @doctor = Doctor.find_by(user_id: @current_user)
    #   @users = @doctor.patients 
    # end
  end

  def create
    @room = Room.create(name: params["room"]["name"])
  end

  def show
    @single_room = Room.find(params[:id])
    @rooms = Room.public_rooms
    @users = User.all_except(@current_user)
    @room = Room.new
    @message = Message.new
    @messages = @single_room.messages
    render "index"
end

end
