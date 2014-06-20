class CreateCarInfos < ActiveRecord::Migration
  def change
    create_table :car_infos do |t|
      t.integer :car_no
      t.string :saletype
      t.string :brand
      t.string :series
      t.string :vin
      t.string :engineid
      t.string :platenumber
      t.string :models
      t.string :ownername
      t.string :ownerphone
      t.string :newsfrom
      t.integer :cooperation_id
      t.string :location
      t.string :rating
      t.decimal :customer_offer, :precision => 20, :scale => 2
      t.decimal :evaluate_price, :precision => 20, :scale => 2
      t.decimal :procurement_price, :precision => 20, :scale => 2
      t.decimal :newcar_price, :precision => 20, :scale => 2
      t.decimal :suggested_price, :precision => 20, :scale => 2
      t.decimal :maintenance_budget, :precision => 20, :scale => 2
      t.decimal :selllimit_price, :precision => 20, :scale => 2
      t.decimal :price_hand, :precision => 20, :scale => 2
      t.string :description
      t.integer :status
      t.integer :user_id
      t.datetime :addtime

      t.timestamps
    end
  end
end
