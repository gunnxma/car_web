class CreatePriceRefHistories < ActiveRecord::Migration
  def change
    create_table :price_ref_histories do |t|
      t.integer :price_ref_id
      t.decimal :price, :precision => 20, :scale => 2
      t.datetime :price_date
      t.datetime :addtime

      t.timestamps
    end
  end
end
