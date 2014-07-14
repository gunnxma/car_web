class AddUserIdToRepairs < ActiveRecord::Migration
  def change
    add_column :repairs, :user_id, :integer
  end
end
