class ApplicationController < ActionController::Base
  include SessionHelper
  before_action :set_current_user
  before_action :authenticate
  def set_current_user
    @current_user = User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def authenticate
   redirect_to new_session_path if @current_user.nil?
  end
  
  
  private
    def logged_in_user
      unless logged_in?
      flash[:danger] = "already log in."
      store_location
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end
  
end
