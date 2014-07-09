class AddAttachmentPhotoToCarPhotos < ActiveRecord::Migration
  def self.up
    change_table :car_photos do |t|
      t.attachment :photo
    end
  end

  def self.down
    drop_attached_file :car_photos, :photo
  end
end
