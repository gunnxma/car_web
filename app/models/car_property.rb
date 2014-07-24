class CarProperty < ActiveRecord::Base
  belongs_to :car_info
  
  validates :cc, :presence => { :message => "排气量不能为空" }
  
  def registration
    "#{ChinaCity.get(self.registration_province)} #{ChinaCity.get(self.registration_city)} #{ChinaCity.get(self.registration_district)}"
  end
end
