class AddUserIdAndAddTimeToCustomers < ActiveRecord::Migration
  def change
    add_column :customers, :user_id, :integer
    add_column :customers, :addtime, :datetime
  end
end
