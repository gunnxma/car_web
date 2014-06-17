class User < ActiveRecord::Base
  belongs_to :department
  has_many :user_powers
  has_many :actions, through: :user_powers
  belongs_to :car_info
  belongs_to :car_assess
end
