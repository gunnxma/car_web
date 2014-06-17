class CreateInteriorColors < ActiveRecord::Migration
  def change
    create_table :interior_colors do |t|
      t.string :name
      t.string :color

      t.timestamps
    end
  end
end
