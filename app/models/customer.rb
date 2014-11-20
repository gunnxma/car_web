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

  validates :sort_id, :presence => { :message => "客户类别不能为空" }
  validates :name, :presence => { :message => "姓名不能为空" }
  validates :phone, :presence => { :message => "电话不能为空" }
  validates :visit_date, :presence => { :message => "到店时间不能为空" }
  validates :sex, :presence => { :message => "性别不能为空" }
  validates :age_id, :presence => { :message => "年龄不能为空" }
  validates :plan_deal_time, :presence => { :message => "预计成交时间不能为空" }
  validates :other, :presence => { :message => "客户描述不能为空" }

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
