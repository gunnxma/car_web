class CarAssess < ActiveRecord::Base
  belongs_to :car_info
  has_one :user
end
