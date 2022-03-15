class PaitensController < ApplicationController
	def index
		@paiten = Paitent.all
	end

	def new
		@paiten = Paitent.new
	end

	def create
		@paiten = Paitent.new(paiten_params)
		if @paitent.save
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
