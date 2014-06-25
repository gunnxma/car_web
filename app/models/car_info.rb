class CarInfo < ActiveRecord::Base
  has_one :car_property
  has_one :car_assess
  has_one :car_configuration
  has_one :cooperation
  
  def status_str
    ["待定", "在库", "在售", "已成交"][self.status]
  end
end
