class CreateCustomerTags < ActiveRecord::Migration
  def change
    create_table :customer_tags do |t|
      t.string :name

      t.timestamps
    end
  end
end
