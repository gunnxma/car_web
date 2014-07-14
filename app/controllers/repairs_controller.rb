class RepairsController < ApplicationController
  MAX_DETAIL = 20
  def index
    @repairs = Repair.all.order(id: :desc)
    respond_to do |format|
      format.html
      format.xls
    end
  end

  def new
    @repair = Repair.new
    MAX_DETAIL.times do
      @repair.repair_details.build
    end
    @repair.style = 0
  end
  
  def create
    @repair = Repair.new(repair_params)
    @repair.cost = 0
    @repair.check = 0
    @repair.addtime = DateTime.now
    @repair.user_id = current_user.id
    @repair.repair_details.each do |item|
      item.cost = 0 if item.cost.nil?
      @repair.cost += item.cost
    end
    
    if @repair.save
      redirect_to :action => :index
    else
      render "new"
    end
  end

  def edit
    @repair = Repair.find(params[:id])
    (MAX_DETAIL-@repair.repair_details.count).times do
      @repair.repair_details.build
    end
  end
  
  def update
    @repair = Repair.find(params[:id])
    @repair.repair_details.delete_all
    @repair.cost = 0
    if @repair.update_attributes(repair_params)
      @repair.repair_details.each do |item|
        item.cost = 0 if item.cost.nil?
        @repair.cost += item.cost
      end
      @repair.save
      redirect_to :action => :edit, :id => @repair.id
    else
      render "edit"
    end
  end
    
  def check
    @repair = Repair.find(params[:id])
    @repair.check = 1
    @repair.save
    redirect_to :action => :index
  end
  
  def destroy
    @repair = Repair.find(params[:id])
    @repair.destroy
    flash[:notice] = "删除成功"
    redirect_to :action => :index
  end
  
  private
  
  def repair_params
    params.require(:repair).permit(:car_info_id, :style, :man_hour, :start_time, :end_time, :status, :remark, repair_details_attributes: [:item, :cost, :remark, :is_cooperation, :cooperation_id])
  end
end
