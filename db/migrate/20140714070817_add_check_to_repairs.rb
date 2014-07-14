class AddCheckToRepairs < ActiveRecord::Migration
  def change
    add_column :repairs, :check, :integer
  end
end
