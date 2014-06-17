class CreateBodyClasses < ActiveRecord::Migration
  def change
    create_table :body_classes do |t|
      t.string :name

      t.timestamps
    end
  end
end
