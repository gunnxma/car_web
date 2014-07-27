class ProfitsController < ApplicationController
  before_filter :check_power
  def index
    if current_user.id == 1
      @q = CarInfo.where(:status => 3).search(params[:q])
    else
      @q = CarInfo.where("status >= 3 and user_id = ?", current_user.id).search(params[:q])
    end
    if request.format == :xls
      @cars = @q.result.include(:car_info).order(addtime: :desc)
    else
      @cars = @q.result.paginate(:page => params[:page]).order(addtime: :desc)
    end
    #@cars = CarInfo.where(:status => 3)
    respond_to do |format|
      format.html
      format.xls
    end
  end
end
