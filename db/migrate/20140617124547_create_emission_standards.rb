class CreateEmissionStandards < ActiveRecord::Migration
  def change
    create_table :emission_standards do |t|
      t.string :name

      t.timestamps
    end
  end
end
