class AddDepotTimeToCarInfo < ActiveRecord::Migration
  def change
    add_column :car_infos, :depot_time, :datetime
  end
end
