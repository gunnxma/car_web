class CdepotsController < ApplicationController
	before_filter :check_power
	def index
		@depots = Depot.all
	end

	def new
		@depot = Depot.new
	end

	def create
		@depot = Depot.new(depot_params)
		if @depot.save
			redirect_to :action => :index
		else
			render :new
		end
	end

	def edit
		@depot = Depot.find(params[:id])
	end

	def update
		@depot = Depot.find(params[:id])
		if @depot.update_attributes(depot_params)
			redirect_to :action => :index
		else
			render :edit
		end
	end

	def destroy
		@depot = Depot.find(params[:id])
		@depot.destroy
		redirect_to :action => :index
	end

	private
  
  def depot_params
    params.require(:depot).permit(:name)
  end

end
