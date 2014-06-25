class Series < ActiveRecord::Base
  belongs_to :brand
  
  validates :name, :presence => { :message => "车系名称不能为空" }
  
  def name_with_initial
    "#{self.initial.downcase} #{self.name}"
  end
end
