class Series < ActiveRecord::Base
  belongs_to :brand
  
  validates :name, :presence => { :message => "车系名称不能为空" }
end
