class CreateCooperations < ActiveRecord::Migration
  def change
    create_table :cooperations do |t|
      t.integer :cooperate_type_id
      t.string :name
      t.string :rule
      t.integer :cooperate_relation_id
      t.integer :cooperate_level_id
      t.string :contact
      t.string :phone
      t.datetime :period_start
      t.datetime :period_end
      t.string :describe
      t.integer :status

      t.timestamps
    end
  end
end
