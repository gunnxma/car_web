class PriceRef < ActiveRecord::Base
  has_many :price_ref_offs, :dependent => :destroy
  has_many :price_ref_histories, :dependent => :destroy
  belongs_to :standard
  
  validates :brand, :presence => { :message => "品牌不能为空" }
  validates :series, :presence => { :message => "车系不能为空" }
  validates :year, :presence => { :message => "年份不能为空" }
  validates :standard_id, :presence => { :message => "车型不能为空" }
  
  accepts_nested_attributes_for :price_ref_offs, :reject_if => lambda { |a| a[:price].blank? }, :allow_destroy => true
  accepts_nested_attributes_for :price_ref_histories, :reject_if => lambda { |a| a[:price].blank? }, :allow_destroy => true
end
