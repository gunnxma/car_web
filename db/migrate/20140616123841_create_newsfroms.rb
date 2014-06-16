class CreateNewsfroms < ActiveRecord::Migration
  def change
    create_table :newsfroms do |t|
      t.string :name

      t.timestamps
    end
  end
end
