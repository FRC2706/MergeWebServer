class FixCommentsAndPicturesStuff < ActiveRecord::Migration
  def change
	rename_column :comments, :team_id, :team_key
	rename_column :pictures, :team_id, :team_key
  end
end
