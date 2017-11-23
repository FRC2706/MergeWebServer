class AddStuffToEvents < ActiveRecord::Migration
  def change
    add_column :events, :team_id, :string
    add_column :events, :goal_id, :string
    add_column :events, :match_id, :string
    add_column :events, :success, :boolean
    add_column :events, :start_time, :datetime
    add_column :events, :end_time, :datetime
  end
end
