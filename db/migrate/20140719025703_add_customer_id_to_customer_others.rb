class AddCustomerIdToCustomerOthers < ActiveRecord::Migration
  def change
    add_column :customer_others, :customer_id, :integer
  end
end
