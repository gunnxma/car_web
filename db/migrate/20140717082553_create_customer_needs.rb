class CreateCustomerNeeds < ActiveRecord::Migration
  def change
    create_table :customer_needs do |t|
      t.string :brand
      t.string :series
      t.string :models
      t.string :brand_others
      t.string :color
      t.string :interior_color
      t.string :transmission
      t.integer :car_sort_id
      t.decimal :cc_min, :precision => 20, :scale => 2
      t.decimal :cc_max, :precision => 20, :scale => 2
      t.string :cc_unit
      t.decimal :mileage_min, :precision => 20, :scale => 2
      t.decimal :mileage_max, :precision => 20, :scale => 2
      t.decimal :car_age_min, :precision => 20, :scale => 2
      t.decimal :car_age_max, :precision => 20, :scale => 2
      t.decimal :expectative_price_min, :precision => 20, :scale => 2
      t.decimal :expectative_price_max, :precision => 20, :scale => 2
      t.string :transfer_area
      t.string :platenumber_demand
      t.integer :is_mortgage
      t.string :mortgage_description

      t.timestamps
    end
  end
end
