class Payment < ActiveRecord::Base
  has_many :payment_details, :dependent => :destroy
  belongs_to :car_info
  belongs_to :user
  
  accepts_nested_attributes_for :payment_details, :reject_if => lambda { |a| a[:cost].blank? }, :allow_destroy => true
  
  validates :car_info_id, :presence => { :message => "必须选择车辆信息" }
end
