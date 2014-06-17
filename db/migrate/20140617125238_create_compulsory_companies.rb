class CreateCompulsoryCompanies < ActiveRecord::Migration
  def change
    create_table :compulsory_companies do |t|
      t.string :name

      t.timestamps
    end
  end
end
