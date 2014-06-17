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
      t.decimal20 :customer_offer
      t.decimal2 :customer_offer
      t.decimal20 :evaluate_price
      t.decimal2 :evaluate_price
      t.decimal20 :procurement_price
      t.decimal2 :procurement_price
      t.decimal20 :newcar_price
      t.decimal2 :newcar_price
      t.decimal20 :suggested_price
      t.decimal2 :suggested_price
      t.decimal20 :maintenance_budget
      t.decimal2 :maintenance_budget
      t.decimal20 :selllimit_price
      t.decimal2 :selllimit_price
      t.decimal20 :price_hand
      t.decimal2 :price_hand
      t.string :description
      t.integer :user_id
      t.datetime :addtime

      t.timestamps
    end
  end
end
