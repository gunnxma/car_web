class CreatePaymentsWays < ActiveRecord::Migration
  def change
    create_table :payments_ways do |t|
      t.string :name

      t.timestamps
    end
  end
end
