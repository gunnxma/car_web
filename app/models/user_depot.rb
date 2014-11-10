class UserDepot < ActiveRecord::Base
	belongs_to :user
	belongs_to :depot
end
