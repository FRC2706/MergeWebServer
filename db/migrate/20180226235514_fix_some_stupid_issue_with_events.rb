class FixSomeStupidIssueWithEvents < ActiveRecord::Migration
  def change
	rename_column :events, :team_id, :team_key
  end
end
