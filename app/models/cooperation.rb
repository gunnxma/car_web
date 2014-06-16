class Cooperation < ActiveRecord::Base
  has_one :cooperate_type
  has_one :cooperate_relation
  has_one :cooperate_level
end
