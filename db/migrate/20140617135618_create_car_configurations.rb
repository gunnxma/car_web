class CreateCarConfigurations < ActiveRecord::Migration
  def change
    create_table :car_configurations do |t|
      t.integer :car_info_id
      t.string :standard
      t.string :safety
      t.string :comfort
      t.string :function
      t.string :other

      t.timestamps
    end
  end
end
