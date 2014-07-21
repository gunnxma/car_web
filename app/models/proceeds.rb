class Proceeds < ActiveRecord::Base
  belongs_to :car_info
  belongs_to :user
  has_many :proceeds_details, :dependent => :destroy
  
  accepts_nested_attributes_for :proceeds_details, :reject_if => lambda { |a| a[:cost].blank? }, :allow_destroy => true
  
  validates :car_info_id, :presence => { :message => "必须选择车辆信息" }
end
