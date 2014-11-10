class CreateUserDepots < ActiveRecord::Migration
  def change
    create_table :user_depots do |t|
      t.integer :user_id
      t.integer :depot_id

      t.timestamps
    end
  end
end
