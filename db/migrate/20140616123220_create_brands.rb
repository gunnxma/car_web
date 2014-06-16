class CreateBrands < ActiveRecord::Migration
  def change
    create_table :brands do |t|
      t.string :initial
      t.string :name

      t.timestamps
    end
  end
end
