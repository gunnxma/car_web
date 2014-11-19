class ChangeTransferNumberToStringForCarProperty < ActiveRecord::Migration
  def up  
    change_column :car_properties, :transfer_number, :string
  end  
  
  def down  
    change_column :car_properties, :transfer_number, :integer
	end
end
