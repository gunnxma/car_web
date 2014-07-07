class CarProperty < ActiveRecord::Base
  belongs_to :car_info
  
  validates :cc, :presence => { :message => "排气量不能为空" }
end
