class AddHasNextToFollowups < ActiveRecord::Migration
  def change
    add_column :followups, :has_next, :integer
  end
end
