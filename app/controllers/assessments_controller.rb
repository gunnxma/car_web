class AssessmentsController < ApplicationController
  def index
    #@q = CarInfo.search(params[:q])
    #@cars = @q.result.paginate(:page => params[:page]).order(:addtime)
    @cars = CarInfo.all.order(id: :desc)
  end
  
  def new
    @car = CarInfo.new
    @car.car_no = get_car_no
    @car.saletype = "寄售"
    @car.init_assocation
    
    @series = nil
  end
  
  def create
    @car = CarInfo.new(car_params)
    @car.addtime = DateTime.now
    @car.status = 0
    
    @car.set_multi_value(params[:business_info], params[:safety], params[:comfort], params[:function])
    
    if @car.save
      redirect_to :action => :index
    else
      render "new"
    end
  end
  
  def edit
    @car = CarInfo.find(params[:id])
    
    @car.init_assocation
    
    brand = Brand.where(:name => @car.brand).first
    @series = brand.series if brand
  end
  
  def update
    @car = CarInfo.find(params[:id])
    old_price = @car.price_to_hash
    if @car.update_attributes(car_params)
      @car.set_multi_value(params[:business_info], params[:safety], params[:comfort], params[:function])
      @car.save
      
      describe = @car.price_change_describe(old_price)      
      PriceLog.create(:car_info_id => @car.id, :describe => describe, :reason => params[:reason], :addtime => DateTime.now, :user_id => current_user.id) unless describe.blank?
      
      redirect_to :action => :edit, :id => @car.id
    else
      render "edit"
    end
  end
  
  def destroy
    @car = CarInfo.find(params[:id])
    @car.destroy
    flash[:notice] = "删除成功"
    redirect_to :action => :index
  end
  
  private
  
  def car_params
    #params.require(:car_info).permit!
    params.require(:car_info).permit(:car_no, :saletype, :brand, :series, :vin, :engineid, :platenumber, :models, :ownername, :ownerphone, :newsfrom, :cooperation_id, :location, :rating, :customer_offer, :evaluate_price, :procurement_price, :newcar_price, :suggested_price, :maintenance_budget, :selllimit_price, :price_hand, :description, :user_id, car_property_attributes: [:transmission, :cc, :cc_unit, :transfer_number, :production_date, :registration_date, :registration_province, :registration_city, :registration_district, :mileage, :maintenance_mileage, :color, :interior_color, :body_class, :emission_standard, :with_plate_number, :use_nature, :insurance_info, :inspection_expire, :compulsory_expire, :compulsory_company, :business_info, :business_expire, :business_company, :insurance_record], car_assess_attributes: [:assess_appearance, :assess_skeletons, :assess_interior, :assess_engine, :assess_transmission, :assess_comprehensive, :user_id], car_configuration_attributes: [:standard, :safety, :comfort, :function, :other])
  end
end
