class CreateCustomerNos < ActiveRecord::Migration
  def change
    create_table :customer_nos do |t|
      t.integer :no

      t.timestamps
    end
  end
end
