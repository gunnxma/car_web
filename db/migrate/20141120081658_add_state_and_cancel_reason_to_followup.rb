class AddStateAndCancelReasonToFollowup < ActiveRecord::Migration
  def change
    add_column :followups, :state, :integer
    add_column :followups, :cancel_reason, :string
  end
end
