class CreateCarNos < ActiveRecord::Migration
  def change
    create_table :car_nos do |t|
      t.integer :no

      t.timestamps
    end
  end
end
