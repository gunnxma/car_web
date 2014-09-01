class CreatePriceRefOffs < ActiveRecord::Migration
  def change
    create_table :price_ref_offs do |t|
      t.integer :price_ref_id
      t.decimal :price, :precision => 20, :scale => 2
      t.datetime :price_date
      t.datetime :addtime

      t.timestamps
    end
  end
end
