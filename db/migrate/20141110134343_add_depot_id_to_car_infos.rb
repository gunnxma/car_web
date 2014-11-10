class AddDepotIdToCarInfos < ActiveRecord::Migration
  def change
  	add_column :car_infos, :depot_id, :integer
  end
end
