class Repair < ActiveRecord::Base
  belongs_to :car_info
  belongs_to :user
  has_many :repair_details, :dependent => :destroy
  accepts_nested_attributes_for :repair_details, :reject_if => lambda { |a| a[:item].blank? }, :allow_destroy => true
  
  def status_str
    ["待整备", "整备中", "已完成"][self.status] unless self.status.nil?
  end
  
  def style_str
    ["首次整备", "二次返修"][self.style] unless self.style.nil?
  end
  
  def check_str
    ["未审核", "已审核"][self.check] unless self.check.nil?
  end
  
  def remain_hour
    hours = 0
    hours = ((Time.parse(self.end_time.to_s) - Time.parse(DateTime.now.to_s)) / 1.hour).round unless self.end_time.nil?
    hours = 0 if hours < 0
    hours
  end
end
