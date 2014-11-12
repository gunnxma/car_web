class SelloffController < ApplicationController
  before_filter :check_power
  def index
    if current_user.id == 1
      @q = CarInfo.where("status = 3").search(params[:q])
    else
      #@q = CarInfo.where("status = 3 and user_id = ?", current_user.id).search(params[:q])
      @q = CarInfo.where("status = 3 and sell_user_id = ?", current_user.id).search(params[:q])
    end
    if request.format == :xls
      @cars = @q.result.order(addtime: :desc)
    else
      @cars = @q.result.paginate(:page => params[:page]).order(addtime: :desc)
    end
    if params[:q] && params[:q][:brand_cont]
      brand = Brand.where(:name => params[:q][:brand_cont]).first
      @series = brand.series if brand
    end
    #@cars = CarInfo.where("status = 3").order(id: :desc)
    respond_to do |format|
      format.html
      format.xls
    end
  end
  
  def new
    @car = CarInfo.where(:id => params[:id], :status => 2).first
    @car.status = 3
    @car.sell_user_id = current_user.id
    @car.selloff_time = DateTime.now.strftime("%Y/%m/%d")
  end
  
  def add
    @car = CarInfo.find(params[:id])
    if params[:car_info][:deal_price].empty?
      flash[:notice] = "请填写销售成交价格"
      render "new"
      return
    end
    
    #@car.selloff_time = DateTime.now
    
    if @car.update_attributes(car_params)
      flash[:notice] = "车辆销售成功"
      redirect_to :action => :index
    else
      render "new"
    end
  end
  
  def edit
    @car = CarInfo.where(:id => params[:id]).first
    @car.selloff_time = DateTime.now.strftime("%Y/%m/%d")
  end
  
  def destroy
    car = CarInfo.find(params[:id])
    car.customer_id = nil
    car.sell_way_id = nil
    car.deal_price = nil
    car.selloff_time = nil
    car.payment_method_id = nil
    car.sell_user_id = nil
    car.status = 2
    car.save
    redirect_to :action => :index
  end
  
  private
  
  def car_params
    params.require(:car_info).permit(:customer_id, :sell_way_id, :deal_price, :payment_method_id, :sell_user_id, :status, :selloff_time)
  end
end