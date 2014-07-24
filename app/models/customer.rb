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
  belongs_to :user
  has_many :followups, as: :followupable, :dependent => :destroy
  
  accepts_nested_attributes_for :customer_need, :customer_other
  accepts_nested_attributes_for :followups, :reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true
  
  validates :name, :presence => { :message => "姓名不能为空" }
  validates :phone, :presence => { :message => "电话不能为空" }
  
  def status_str
    ["待定", "已成交"][self.status] unless self.status.nil?
  end
  
  def need_car
    "#{self.customer_need.brand} #{self.customer_need.series}" unless self.customer_need.nil?
  end
  
  def need_price
    "#{self.customer_need.expectative_price_min}-#{self.customer_need.expectative_price_max}万" unless self.customer_need.nil?
  end
  
  def business_stage
    self.customer_other.business_stage unless self.customer_other.nil?
  end
end
