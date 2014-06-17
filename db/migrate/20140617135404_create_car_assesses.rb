class CreateCarAssesses < ActiveRecord::Migration
  def change
    create_table :car_assesses do |t|
      t.integer :car_info_id
      t.string :assess_appearance
      t.string :assess_skeletons
      t.string :assess_interior
      t.string :assess_engine
      t.string :assess_transmission
      t.string :assess_comprehensive
      t.integer :user_id

      t.timestamps
    end
  end
end
