class ChangeDescriptionToTextInCarInfos < ActiveRecord::Migration
  def up
    change_column :car_infos, :description, :text
  end
  
  def down
    change_column :car_infos, :description, :string
  end
end
