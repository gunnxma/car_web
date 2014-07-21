class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.integer :car_info_id
      t.integer :user_id
      t.decimal :cost, :precision => 10, :scale => 2
      t.datetime :addtime

      t.timestamps
    end
  end
end
