class BrandsController < ApplicationController
  before_filter :check_power
  def index
    #@q = Brand.search(params[:q])
    #@brands = @q.result.paginate(:page => params[:page]).order(:initial)
    @brands = Brand.all
  end

  def create
    @brand = Brand.new(brand_params)
    @brand.initial = PinYin.abbr(@brand.name.first).downcase
    if @brand.save
      redirect_to :action => :new
    else
      render "new"
    end
  end

  def new
    @brand = Brand.new
  end

  def edit
    @brand = Brand.find(params[:id])
  end

  def show
  end

  def update
    @brand = Brand.find(params[:id])
    @brand.name = params[:brand][:name]
    @brand.initial = PinYin.abbr(@brand.name.first)
    if @brand.save
      redirect_to :action => :index
    else
      render "edit"
    end
  end

  def destroy
    @brand = Brand.find(params[:id])
    @brand.destroy
    redirect_to :action => :index
  end
  
  private
  
  def brand_params
    params.require(:brand).permit(:name)
  end
end
