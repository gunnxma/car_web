class AddTipIdToUser < ActiveRecord::Migration
  def change
    add_column :users, :tip_id, :integer
  end
end
