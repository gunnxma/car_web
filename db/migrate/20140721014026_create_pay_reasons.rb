class CreatePayReasons < ActiveRecord::Migration
  def change
    create_table :pay_reasons do |t|
      t.string :name

      t.timestamps
    end
  end
end
