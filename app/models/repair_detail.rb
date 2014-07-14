class RepairDetail < ActiveRecord::Base
  belongs_to :repair
  belongs_to :cooperation
end
