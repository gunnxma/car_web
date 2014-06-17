class CreateUseNatures < ActiveRecord::Migration
  def change
    create_table :use_natures do |t|
      t.string :name

      t.timestamps
    end
  end
end
