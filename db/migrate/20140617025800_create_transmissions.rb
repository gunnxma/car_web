class CreateTransmissions < ActiveRecord::Migration
  def change
    create_table :transmissions do |t|
      t.string :name

      t.timestamps
    end
  end
end
