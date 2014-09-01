class CreatePriceRefs < ActiveRecord::Migration
  def change
    create_table :price_refs do |t|
      t.string :brand
      t.string :series
      t.integer :year
      t.integer :standard_id
      t.decimal :price_newcar, :precision => 20, :scale => 2
      t.decimal :price_buy, :precision => 20, :scale => 2
      t.text :configuration
      t.datetime :addtime

      t.timestamps
    end
  end
end
