class SellController < ApplicationController
  before_filter :check_power
  def index
    @cars = CarInfo.where("status = 2").order(id: :desc)
    respond_to do |format|
      format.html
      format.xls
    end
  end
  
  def add
    car = CarInfo.find(params[:id])
    car.status = 2 if car.status == 1
    car.sell_time = DateTime.now
    car.save
    redirect_to :action => :index
  end
end
