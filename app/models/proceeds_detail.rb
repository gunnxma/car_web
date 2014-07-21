class ProceedsDetail < ActiveRecord::Base
  belongs_to :proceeds
  belongs_to :proceeds_reason
  belongs_to :payments_way
end
