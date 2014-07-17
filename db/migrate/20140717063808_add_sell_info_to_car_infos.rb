class AddSellInfoToCarInfos < ActiveRecord::Migration
  def change
    add_column :car_infos, :customer_id, :integer
    add_column :car_infos, :sell_way_id, :integer
    add_column :car_infos, :deal_price, :decimal, :precision => 20, :scale => 2
    add_column :car_infos, :payment_method_id, :integer
    add_column :car_infos, :sell_user_id, :integer
  end
end
