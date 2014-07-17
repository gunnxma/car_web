class AddSellTimeToCarInfos < ActiveRecord::Migration
  def change
    add_column :car_infos, :sell_time, :datetime
  end
end
