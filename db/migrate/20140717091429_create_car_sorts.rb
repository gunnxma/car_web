class CreateCarSorts < ActiveRecord::Migration
  def change
    create_table :car_sorts do |t|
      t.string :name

      t.timestamps
    end
  end
end
