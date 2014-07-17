class Customer < ActiveRecord::Base
  has_one :customer_need, :dependent => :destroy
  has_one :customer_other, :dependent => :destroy
  has_many :car_infos
  belongs_to :customer_sort, :foreign_key => "sort_id"
  belongs_to :call_type
  belongs_to :age
  belongs_to :industry
  belongs_to :duty
  belongs_to :income
  
  accepts_nested_attributes_for :customer_need, :customer_other
end
