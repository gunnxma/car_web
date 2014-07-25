class ProceedsController < ApplicationController
  before_filter :check_power
  MAX_DETAIL = 20
  def index
    @proceeds = Proceeds.order(addtime: :desc)
    respond_to do |format|
      format.html
      format.xls
    end
  end

  def new
    @proceeds = Proceeds.new
    init_new_proceeds
  end
  
  def create
    @proceeds = Proceeds.new(proceeds_params)
    @proceeds.cost = 0
    @proceeds.addtime = DateTime.now
    @proceeds.proceeds_details.each do |item|
      item.cost = 0 if item.cost.nil?
      @proceeds.cost += item.cost
    end
    
    if @proceeds.save
      redirect_to :action => :index
    else
      init_new_proceeds
      render "new"
    end
  end

  def edit
    @proceeds = Proceeds.find(params[:id])
    init_edit_proceeds
  end
  
  def update
    @proceeds = Proceeds.find(params[:id])
    @proceeds.proceeds_details.delete_all
    @proceeds.cost = 0
    if @proceeds.update_attributes(proceeds_params)
      @proceeds.proceeds_details.each do |item|
        item.cost = 0 if item.cost.nil?
        @proceeds.cost += item.cost
      end
      @proceeds.save
      redirect_to :action => :edit, :id => @proceeds.id
    else
      init_edit_proceeds
      render "edit"
    end
  end
  
  def destroy
    @proceeds = Proceeds.find(params[:id])
    @proceeds.destroy
    flash[:notice] = "删除成功"
    redirect_to :action => :index
  end
  
  private
  
  def init_new_proceeds
    MAX_DETAIL.times do
      @proceeds.proceeds_details.build
    end
  end
  
  def init_edit_proceeds
    (MAX_DETAIL-@proceeds.proceeds_details.count).times do
      @proceeds.proceeds_details.build
    end
  end
  
  def proceeds_params
    params.require(:proceeds).permit(:car_info_id, :user_id, proceeds_details_attributes: [:proceeds_reason_id, :cost, :remark, :payments_way_id])
  end
end
