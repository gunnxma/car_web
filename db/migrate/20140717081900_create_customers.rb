class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.integer :sort_id
      t.string :no
      t.string :name
      t.string :phone
      t.string :weixin
      t.string :address
      t.datetime :call_time
      t.integer :call_type_id
      t.integer :sex
      t.string :id_number
      t.datetime :birthday
      t.integer :age_id
      t.integer :industry_id
      t.integer :duty_id
      t.integer :income_id
      t.integer :status
      t.datetime :plan_deal_time

      t.timestamps
    end
  end
end
