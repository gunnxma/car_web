class Customer < ActiveRecord::Base
  has_one :customer_need, :dependent => :destroy
  has_one :customer_other, :dependent => :destroy
  has_many :car_infos
  belongs_to :customer_sort, :foreign_key => "sort_id"
  belongs_to :call_type
  belongs_to :age
  belongs_to :industry
  belongs_to :duty
  belongs_to :income
  
  accepts_nested_attributes_for :customer_need, :customer_other
  
  def status_str
    ["待定", "已成交"][self.status] unless self.status.nil?
  end
  
  def need_car
    "#{self.customer_need.band} #{self.customer_need.series}" unless self.customer_need.nil?
  end
  
  def need_price
    "#{self.customer_need.expectative_price_min}-#{self.customer_need.expectative_price_max}万" unless self.customer_need.nil?
  end
  
  def business_stage
    self.customer_other.business_stage unless self.customer_other.nil?
  end
end
