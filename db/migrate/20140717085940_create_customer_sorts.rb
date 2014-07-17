class CreateCustomerSorts < ActiveRecord::Migration
  def change
    create_table :customer_sorts do |t|
      t.string :name

      t.timestamps
    end
  end
end
