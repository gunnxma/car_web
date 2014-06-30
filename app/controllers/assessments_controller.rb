class AssessmentsController < ApplicationController
  def index
    @q = CarInfo.search(params[:q])
    @cars = @q.result.paginate(:page => params[:page]).order(:addtime)
  end
  
  def new
    @car = CarInfo.new
    @car.saletype = "寄售"
    @car.car_property = CarProperty.create( :business_info => "" )
    @car.car_configuration = CarConfiguration.create( :safety => "", :comfort => "", :function => "" )
  end
end
