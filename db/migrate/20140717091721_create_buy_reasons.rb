class CreateBuyReasons < ActiveRecord::Migration
  def change
    create_table :buy_reasons do |t|
      t.string :name

      t.timestamps
    end
  end
end
