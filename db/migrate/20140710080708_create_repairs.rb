class CreateRepairs < ActiveRecord::Migration
  def change
    create_table :repairs do |t|
      t.integer :car_info_id
      t.integer :style
      t.decimal :man_hour, :precision => 10, :scale => 2
      t.datetime :start_time
      t.datetime :end_time
      t.decimal :cost
      t.integer :status
      t.string :remark
      t.datetime :addtime

      t.timestamps
    end
  end
end
