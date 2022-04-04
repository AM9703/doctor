class PaitensController < ApplicationController
  def index
    @paiten = Paitent.all
  end

  def new
    @user_id = params[:user_id]
    @paiten = Paitent.new
  end

  def create
    @paiten = Paitent.new(paiten_params)
    if @paitent.save
      @user_id = params[:user_id]
      redirect_to paitents_path
    else
      render :new
    end
  end

  private

  def paiten_params
    params.require(:paitent).permit(:name, :gender, :age)
  end

end
