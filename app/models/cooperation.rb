class Cooperation < ActiveRecord::Base
  has_one :cooperate_type
  has_one :cooperate_relation
  has_one :cooperate_level
  belongs_to :car_info
  has_one :user
end
