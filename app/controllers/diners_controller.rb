class DinersController < ApplicationController

	def show
		@diner = Diner.find(params[:id])
		@reservations = @diner.reservations.all
	end

	def new
		@diner = Diner.new
	end

	def create
		@diner = Diner.new(diner_params)

		if @diner.save
			redirect_to diner_path(@diner.id)
		else
			render :new
		end		
	end

	def diner_params
		params.require(:diner).permit(:name, :email, :password, :password_confirmation)
	end

end