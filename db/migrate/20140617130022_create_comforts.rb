class CreateComforts < ActiveRecord::Migration
  def change
    create_table :comforts do |t|
      t.string :name

      t.timestamps
    end
  end
end
