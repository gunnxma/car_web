class AddSelloffTimeToCarInfos < ActiveRecord::Migration
  def change
    add_column :car_infos, :selloff_time, :datetime
  end
end
