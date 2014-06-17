class CarInfo < ActiveRecord::Base
  has_one :car_property
  has_one :car_assess
  has_one :car_configuration
  has_one :cooperation
end
