class Depot < ActiveRecord::Base
	has_many :user_depots
	has_many :users, through: :user_depots
	has_many :car_infos
end
