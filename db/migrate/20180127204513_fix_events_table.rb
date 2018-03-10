class FixEventsTable < ActiveRecord::Migration
  def change
	remove_column :events, :goal_id
	add_column :events, :goal, :text
  end
end
