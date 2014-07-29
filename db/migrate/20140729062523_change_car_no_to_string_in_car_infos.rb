class ChangeCarNoToStringInCarInfos < ActiveRecord::Migration
  def up
    change_column :car_infos, :car_no, :string
  end
  
  def down
    change_column :car_infos, :car_no, :integer
  end
end
