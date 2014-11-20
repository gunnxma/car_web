class AddOtherToCustomer < ActiveRecord::Migration
  def change
    add_column :customers, :other, :string
  end
end
