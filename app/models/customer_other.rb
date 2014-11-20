class CustomerOther < ActiveRecord::Base
  belongs_to :customer
  belongs_to :experience
  belongs_to :buy_reason
  belongs_to :network
  belongs_to :tag, :class_name => "CustomerTag", :foreign_key => "tag_id"
  belongs_to :business_stage

  validates :experience_id, :presence => { :message => "购车经验不能为空" }
  validates :buy_reason_id, :presence => { :message => "购车原因不能为空" }
  validates :undeal_reason, :presence => { :message => "未成交原因不能为空" }
  validates :fit_models, :presence => { :message => "可匹配车型不能为空" }
  validates :tag_id, :presence => { :message => "客户标签不能为空" }
  validates :business_stage_id, :presence => { :message => "商机阶段不能为空" }
end
