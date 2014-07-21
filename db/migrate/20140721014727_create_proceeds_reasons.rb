class CreateProceedsReasons < ActiveRecord::Migration
  def change
    create_table :proceeds_reasons do |t|
      t.string :name

      t.timestamps
    end
  end
end
