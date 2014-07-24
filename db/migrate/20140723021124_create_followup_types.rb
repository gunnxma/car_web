class CreateFollowupTypes < ActiveRecord::Migration
  def change
    create_table :followup_types do |t|
      t.string :name

      t.timestamps
    end
  end
end
