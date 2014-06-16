class CreateActions < ActiveRecord::Migration
  def change
    create_table :actions do |t|
      t.string :controller
      t.string :action
      t.string :name

      t.timestamps
    end
  end
end
