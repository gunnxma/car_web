class CreateSafeties < ActiveRecord::Migration
  def change
    create_table :safeties do |t|
      t.string :name

      t.timestamps
    end
  end
end
