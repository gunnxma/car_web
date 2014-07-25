class SelloffController < ApplicationController
  before_filter :check_power
  def index
    @cars = CarInfo.where("status = 3").order(id: :desc)
    respond_to do |format|
      format.html
      format.xls
    end
  end
  
  def new
    @car = CarInfo.where(:id => params[:id], :status => 2).first
    @car.status = 3
  end
  
  def add
    @car = CarInfo.find(params[:id])
    if params[:car_info][:deal_price].empty?
      flash[:notice] = "请填写销售成交价格"
      render "new"
      return
    end
    
    @car.selloff_time = DateTime.now
    
    if @car.update_attributes(car_params)
      flash[:notice] = "车辆销售成功"
      redirect_to :action => :index
    else
      render "new"
    end
  end
  
  private
  
  def car_params
    params.require(:car_info).permit(:customer_id, :sell_way_id, :deal_price, :payment_method_id, :sell_user_id, :status)
  end
end