class CreateCarPhotos < ActiveRecord::Migration
  def change
    create_table :car_photos do |t|
      t.integer :car_info_id
      t.integer :photo_style

      t.timestamps
    end
  end
end
