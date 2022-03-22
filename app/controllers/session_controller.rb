class SessionController < ApplicationController
 
  def index
  end

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user.present? && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to root_path 
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy  
    session[:user_id] = nil
    redirect_to new_session_path
  end
  
end
