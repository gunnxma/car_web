class CustomerSort < ActiveRecord::Base
  has_many :customers, :foreign_key => "sort_id"
end
