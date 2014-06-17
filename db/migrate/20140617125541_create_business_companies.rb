class CreateBusinessCompanies < ActiveRecord::Migration
  def change
    create_table :business_companies do |t|
      t.string :name

      t.timestamps
    end
  end
end
