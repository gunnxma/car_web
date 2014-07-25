class SeriesController < ApplicationController
  before_filter :check_power, :except => [ :ajax_search ]
  
  def index
    @brand = Brand.find(params[:brand_id])
    #@q = @brand.series.search(params[:q])
    #@series = @q.result.paginate(:page => params[:page]).order(:initial)
    @series = @brand.series
  end
  
  def ajax_search
    @brand = Brand.where(:name => params[:brand]).first
    @series = @brand.series
    respond_to do |format|
      format.json { render :json => @series.to_json }
    end
  end

  def create
    @brand = Brand.find(params[:brand_id])
    @series = Series.new(series_params)
    @series.initial = PinYin.abbr(@series.name.first).downcase
    @brand.series << @series
    if @brand.save
      redirect_to :action => :new
    else
      render "new"
    end
  end

  def new
    @brand = Brand.find(params[:brand_id])
    @series = Series.new
  end

  def edit
    @brand = Brand.find(params[:brand_id])
    @series = Series.find(params[:id])
  end

  def show
  end

  def update
    @brand = Brand.find(params[:brand_id])
    @series = @brand.series.find(params[:id])
    @series.name = params[:series][:name]
    @series.initial = PinYin.abbr(@series.name.first)
    if @series.save
      redirect_to :action => :index
    else
      render "edit"
    end
  end

  def destroy
    @series = Series.find(params[:id])
    @series.destroy
    redirect_to :action => :index
  end
  
  private
  
  def series_params
    params.require(:series).permit(:name)
  end
end
