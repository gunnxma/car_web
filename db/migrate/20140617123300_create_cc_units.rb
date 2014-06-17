class CreateCcUnits < ActiveRecord::Migration
  def change
    create_table :cc_units do |t|
      t.string :name

      t.timestamps
    end
  end
end
