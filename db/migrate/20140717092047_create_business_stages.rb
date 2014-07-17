class CreateBusinessStages < ActiveRecord::Migration
  def change
    create_table :business_stages do |t|
      t.string :name

      t.timestamps
    end
  end
end
