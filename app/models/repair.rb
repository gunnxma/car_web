class Repair < ActiveRecord::Base
  belongs_to :car_info
  has_many :repair_details
  
  def status_str
    ["待整备", "整备中", "已完成"][self.status]
  end
  
  def style_str
    ["首次整备", "二次返修"][self.style]
  end
end
