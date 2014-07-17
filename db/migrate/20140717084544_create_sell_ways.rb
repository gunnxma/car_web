class CreateSellWays < ActiveRecord::Migration
  def change
    create_table :sell_ways do |t|
      t.string :name

      t.timestamps
    end
  end
end
