class CreateCooperateLevels < ActiveRecord::Migration
  def change
    create_table :cooperate_levels do |t|
      t.string :name

      t.timestamps
    end
  end
end
