class DashboardController < ApplicationController
  before_action :log_in_user, only: [:index]

  def index
    # binding.pry
    @current_user
  end

  private

    def log_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to new_session_path
      end
    end
end
