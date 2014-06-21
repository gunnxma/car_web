class Brand < ActiveRecord::Base
  has_many :series
  
  validates :name, :presence => { :message => "品牌名称不能为空" },
                   :uniqueness => { :message => "品牌名称不能重复"}
end
