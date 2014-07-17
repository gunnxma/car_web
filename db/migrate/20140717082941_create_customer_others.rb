class CreateCustomerOthers < ActiveRecord::Migration
  def change
    create_table :customer_others do |t|
      t.integer :experience_id
      t.integer :buy_reason_id
      t.string :undeal_reason
      t.string :seen_models
      t.string :fit_models
      t.string :newsfrom
      t.integer :network_id
      t.integer :tag_id
      t.integer :business_stage_id

      t.timestamps
    end
  end
end
