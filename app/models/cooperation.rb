class Cooperation < ActiveRecord::Base
  belongs_to :cooperate_type
  has_one :cooperate_relation
  has_one :cooperate_level
  belongs_to :car_info
  has_one :user
  has_many :repair_details
end
