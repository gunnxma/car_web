class CreateProceedsDetails < ActiveRecord::Migration
  def change
    create_table :proceeds_details do |t|
      t.integer :proceeds_id
      t.integer :proceeds_reason_id
      t.decimal :cost, :precision => 10, :scale => 2
      t.string :remark
      t.integer :payments_way_id

      t.timestamps
    end
  end
end
