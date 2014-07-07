class User < ActiveRecord::Base
  belongs_to :department
  has_many :user_powers
  has_many :actions, through: :user_powers
  has_many :car_infos
  has_many :car_assesses
  has_many :price_logs
end
