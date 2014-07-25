class DepotController < ApplicationController
  before_filter :check_power
  def index
    @cars = CarInfo.where("status > 0").order(id: :desc)
    respond_to do |format|
      format.html
      format.xls
    end
  end
  
  def add
    car = CarInfo.find(params[:id])
    car.status = 1 if car.status.nil? || car.status == 0
    car.depot_time = DateTime.now
    car.save
    redirect_to :action => :index
  end
end
