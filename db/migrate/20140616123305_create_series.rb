class CreateSeries < ActiveRecord::Migration
  def change
    create_table :series do |t|
      t.integer :brand_id
      t.string :initial
      t.string :name

      t.timestamps
    end
  end
end
