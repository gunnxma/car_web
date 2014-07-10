class CreateRepairDetails < ActiveRecord::Migration
  def change
    create_table :repair_details do |t|
      t.integer :repair_id
      t.string :item
      t.decimal :cost, :precision => 20, :scale => 2
      t.string :remark
      t.integer :is_cooperation
      t.integer :cooperation_id

      t.timestamps
    end
  end
end
