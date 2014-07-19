class CustomerNeed < ActiveRecord::Base
  belongs_to :customer
  belongs_to :car_sort
  
  validates :brand, :presence => { :message => "品牌不能为空" }
  validates :series, :presence => { :message => "车系不能为空" }
end
