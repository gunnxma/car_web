class CreateUserPowers < ActiveRecord::Migration
  def change
    create_table :user_powers do |t|
      t.integer :user_id
      t.integer :action_id

      t.timestamps
    end
  end
end
