class PaymentMethod < ActiveRecord::Base
  has_many :car_infos
end
