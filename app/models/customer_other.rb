class CustomerOther < ActiveRecord::Base
  belongs_to :customer
  belongs_to :experience
  belongs_to :buy_reason
  belongs_to :network
  belongs_to :tag, :class_name => "CustomerTag", :foreign_key => "tag_id"
  belongs_to :business_stage
end
