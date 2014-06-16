class CreateSaletypes < ActiveRecord::Migration
  def change
    create_table :saletypes do |t|
      t.string :name

      t.timestamps
    end
  end
end
