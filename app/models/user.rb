class User < ActiveRecord::Base
  belongs_to :department
  has_many :user_powers
  has_many :actions, through: :user_powers
end
