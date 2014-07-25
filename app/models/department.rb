class Department < ActiveRecord::Base
  has_many :users
  
  validates :name, :presence => { :message => "部门名称不能为空" }
end
