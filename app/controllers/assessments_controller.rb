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
  
  def create
    @car = CarInfo.new(car_params)
    if @car.save
      redirect_to :action => :index
    else
      render "new"
    end
  end
  
  private
  
  def car_params
    #params.require(:car_info).permit!
    params.require(:car_info).permit(:car_no, :saletype, :brand, :series, :vin, :engineid, :platenumber, :models, :ownername, :ownerphone, :newsfrom, :cooperation_id, :location, :rating, :customer_offer, :evaluate_price, :procurement_price, :newcar_price, :suggested_price, :maintenance_budget, :selllimit_price, :price_hand, :description, :user_id, car_property_attributes: [:transmission, :cc, :cc_unit, :transfer_number, :production_date, :registration_date, :registration_province, :registration_city, :registration_district, :mileage, :maintenance_mileage, :color, :interior_color, :body_class, :emission_standard, :with_plate_number, :use_nature, :insurance_info, :inspection_expire, :compulsory_expire, :compulsory_company, :business_info, :business_expire, :business_company, :insurance_record], car_assess_attributes: [:assess_appearance, :assess_skeletons, :assess_interior, :assess_engine, :assess_transmission, :assess_comprehensive, :user_id], car_configuration_attributes: [:standard, :safety, :comfort, :function, :other])
  end
end
