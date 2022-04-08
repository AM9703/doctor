class ApplicationController < ActionController::Base
  include SessionHelper
  protect_from_forgery with: :null_session
  before_action :set_current_user

  def set_current_user 
    @current_user = User.find_by(id: session[:user_id]) if session[:user_id]
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
