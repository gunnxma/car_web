class CreateCarProperties < ActiveRecord::Migration
  def change
    create_table :car_properties do |t|
      t.integer :car_info_id
      t.string :transmission
      t.string :cc
      t.string :cc_unit
      t.integer :transfer_number
      t.datetime :production_date
      t.datetime :registration_date
      t.string :registration_province
      t.string :registration_city
      t.string :registration_district
      t.decimal :mileage, :precision => 10, :scale => 2
      t.decimal :maintenance_mileage, :precision => 10, :scale => 2
      t.string :color
      t.string :interior_color
      t.string :body_class
      t.string :emission_standard
      t.integer :with_plate_number
      t.string :use_nature
      t.string :insurance_info
      t.datetime :inspection_expire
      t.datetime :compulsory_expire
      t.string :compulsory_company
      t.string :business_info
      t.datetime :business_expire
      t.string :business_company
      t.string :insurance_record

      t.timestamps
    end
  end
end
