class CreatePriceLogs < ActiveRecord::Migration
  def change
    create_table :price_logs do |t|
      t.integer :car_info_id
      t.string :describe
      t.string :reason
      t.datetime :addtime
      t.integer :user_id

      t.timestamps
    end
  end
end
