class Action < ActiveRecord::Base
  has_many :user_powers
  has_many :users, through: :user_powers
end
