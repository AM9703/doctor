class SessionController < ApplicationController

  def index
    redirect_to root_path
  end

  def new
   if logged_in? 
      redirect_to root_path
    else
      render 'new'
   end
  end

  def create
    # binding.pry
    user = User.find_by(email: params[:session][:email].downcase)
    if user.present? && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to root_path 
    else
      render 'new'
    end
  end

  def destroy  
    session[:user_id] = nil
    redirect_to new_session_path
  end

end
