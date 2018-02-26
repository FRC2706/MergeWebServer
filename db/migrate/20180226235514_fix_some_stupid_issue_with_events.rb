class FixSomeStupidIssueWithEvents < ActiveRecord::Migration[5.0]
  def change
	rename_column :events, :team_id, :team_key
  end
end
