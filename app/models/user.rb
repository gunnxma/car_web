class User < ActiveRecord::Base
  belongs_to :department
  has_many :user_powers, :dependent => :destroy
  has_many :actions, through: :user_powers
  has_many :car_infos
  has_many :car_assesses
  has_many :price_logs
  has_many :repairs
  has_many :payments
  has_many :proceeds
  has_many :followups
  
  validates :name, :presence => { :message => "用户姓名不能为空" }
  validates :account, :presence => { :message => "帐号不能为空" }
  validates :pwd, :presence => { :message => "密码不能为空" }
  validates :account, uniqueness: true
  
  accepts_nested_attributes_for :user_powers, :reject_if => lambda { |a| a[:action_id].blank? }, :allow_destroy => true
  
  def has_power(controller, action)
    if self.id == 1
      true
    else
      !self.actions.where("controller = ? and action = ?", controller,action).empty?
    end
  end
end
