class ProfitsController < ApplicationController
  before_filter :check_power
  def index
    if current_user.id == 1
      @q = CarInfo.where(:status => 3).search(params[:q])      
    else
      @q = CarInfo.where("status >= 3 and sell_user_id = ?", current_user.id).search(params[:q])
    end
    if request.format == :xls
      @cars = @q.result.include(:car_info).order(addtime: :desc)
    else
      @cars = @q.result.paginate(:page => params[:page]).order(addtime: :desc)
    end
    if params[:q] && params[:q][:brand_cont]
      brand = Brand.where(:name => params[:q][:brand_cont]).first
      @series = brand.series if brand
    end
    @profit_sum = 0
    @cars.each do |car|
      @profit_sum += car.profit_costs
    end

    #@cars = CarInfo.where(:status => 3)
    respond_to do |format|
      format.html
      format.xls
    end
  end
end
