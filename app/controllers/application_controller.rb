class ApplicationController < ActionController::Base
  include SessionHelper
  protect_from_forgery with: :null_session
  before_action :set_current_user

  def set_current_user 
    @current_user = User.find_by(id: session[:user_id]) if session[:user_id]
  end
  
end
