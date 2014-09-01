class PriceRefsController < ApplicationController
  before_filter :check_power
  MAX_OFFS = 20
  MAX_HISTORIES = 20
  
  def index
    @q = PriceRef.all.search(params[:q])
    @price_refs = @q.result.paginate(:page => params[:page]).order(addtime: :desc)
    
    if params[:q] && params[:q][:brand_cont]
      brand = Brand.where(:name => params[:q][:brand_cont]).first
      @series = brand.series if brand
    end
  end
  
  def new
    @price_ref = PriceRef.new
    MAX_OFFS.times do
      @price_ref.price_ref_offs.build
    end
    MAX_HISTORIES.times do
      @price_ref.price_ref_histories.build
    end
  end
  
  def create
    @price_ref = PriceRef.new(price_ref_params)
    @price_ref.addtime = DateTime.now
    
    if @price_ref.save
      redirect_to :action => :index
    else
      render "new"
    end
  end
  
  def edit
    @price_ref = PriceRef.find(params[:id])
    (MAX_OFFS-@price_ref.price_ref_offs.count).times do
      @price_ref.price_ref_offs.build
    end
    (MAX_HISTORIES-@price_ref.price_ref_histories.count).times do
      @price_ref.price_ref_histories.build
    end
    
    brand = Brand.where(:name => @price_ref.brand).first
    @series = brand.series if brand
  end
  
  def update
    @price_ref = PriceRef.find(params[:id])
    @price_ref.price_ref_offs.delete_all
    @price_ref.price_ref_histories.delete_all
    if @price_ref.update_attributes(price_ref_params)
      redirect_to :action => :edit, :id => @price_ref.id
    else
      render "edit"
    end
  end
  
  def destroy
    @price_ref = PriceRef.find(params[:id])
    @price_ref.destroy
    flash[:notice] = "删除成功"
    redirect_to :action => :index
  end
  
  private
  
  def price_ref_params
    params.require(:price_ref).permit(:brand, :series, :year, :standard_id, :price_newcar, :price_buy, :configuration, price_ref_offs_attributes: [:price, :price_date], price_ref_histories_attributes: [:price, :price_date])
  end
end
