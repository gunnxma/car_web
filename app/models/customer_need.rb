class CustomerNeed < ActiveRecord::Base
  belongs_to :customer
  belongs_to :car_sort

  validates :brand, :presence => { :message => "品牌不能为空" }
  validates :series, :presence => { :message => "车系不能为空" }
  validates :models, :presence => { :message => "车型不能为空" }
  validates :brand_others, :presence => { :message => "其他需求品牌不能为空" }
  validates :transfer_area, :presence => { :message => "过户地区不能为空" }
  validates :is_mortgage, :presence => { :message => "是否按揭不能为空" }

  def cc_require
    "#{self.cc_min} ~ #{self.cc_max} #{self.cc_unit}"
  end

  def mileage_require
    "#{self.mileage_min} ~ #{self.mileage_max} 万公里"
  end

  def car_age_require
    "#{self.car_age_min} ~ #{self.car_age_max} 年"
  end

  def expectative_price_require
    "#{self.expectative_price_min} ~ #{self.expectative_price_max} 万元"
  end

  def is_mortgage_str
    ["否","是"][self.is_mortgage]
  end
end
