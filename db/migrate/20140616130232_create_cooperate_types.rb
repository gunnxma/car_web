class CreateCooperateTypes < ActiveRecord::Migration
  def change
    create_table :cooperate_types do |t|
      t.string :name

      t.timestamps
    end
  end
end
