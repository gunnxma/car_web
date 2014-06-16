class CreateCooperateRelations < ActiveRecord::Migration
  def change
    create_table :cooperate_relations do |t|
      t.string :name

      t.timestamps
    end
  end
end
