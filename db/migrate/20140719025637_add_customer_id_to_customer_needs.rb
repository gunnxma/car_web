class AddCustomerIdToCustomerNeeds < ActiveRecord::Migration
  def change
    add_column :customer_needs, :customer_id, :integer
  end
end
