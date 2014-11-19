class AddVisitDateToCustomer < ActiveRecord::Migration
  def change
  	add_column :customers, :visit_date, :datetime
  end
end
