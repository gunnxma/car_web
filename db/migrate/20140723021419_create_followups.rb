class CreateFollowups < ActiveRecord::Migration
  def change
    create_table :followups do |t|
      t.integer :followup_type_id
      t.string :content
      t.string :next_content
      t.datetime :next_time
      t.references :followupable, polymorphic: true
      t.integer :is_finished
      t.integer :user_id
      t.datetime :addtime

      t.timestamps
    end
  end
end
