class SelloffController < ApplicationController
  def index
    @cars = CarInfo.where("status = 3").order(id: :desc)
    respond_to do |format|
      format.html
      format.xls
    end
  end
  
  def add
    car = CarInfo.find(params[:id])
    car.status = 3 if car.status == 2
    car.sell_time = DateTime.now
    car.save
    redirect_to :action => :index
  end
end
