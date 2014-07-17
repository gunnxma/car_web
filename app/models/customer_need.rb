class CustomerNeed < ActiveRecord::Base
  belongs_to :customer
  belongs_to :car_sort
end
