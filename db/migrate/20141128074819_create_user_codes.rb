class CreateUserCodes < ActiveRecord::Migration
  def change
    create_table :user_codes do |t|
      t.integer :user_id
      t.string :code
      t.integer :status

      t.timestamps
    end
  end
end
