class BrandsController < ApplicationController
  def index
    @q = Brand.search(params[:q])
    @brands = @q.result.paginate(:page => params[:page], :per_page => 2)
  end

  def create
    @brand = Brand.new(brand_params)
    if @brand.save
      redirect_to :action => :index
    else
      render "new"
    end
  end

  def new
    @brand = Brand.new
  end

  def edit
  end

  def show
  end

  def update
  end

  def destroy
  end
  
  private
  
  def brand_params
    params.require(:brand).permit(:name)
  end
end
