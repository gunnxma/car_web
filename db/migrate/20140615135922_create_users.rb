class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :department_id
      t.string :name
      t.string :account
      t.string :pwd
      t.string :phone

      t.timestamps
    end
  end
end
