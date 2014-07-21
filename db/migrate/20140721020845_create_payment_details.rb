class CreatePaymentDetails < ActiveRecord::Migration
  def change
    create_table :payment_details do |t|
      t.integer :payment_id
      t.integer :pay_reason_id
      t.decimal :cost, :precision => 10, :scale => 2
      t.string :remark
      t.integer :payments_way_id

      t.timestamps
    end
  end
end
