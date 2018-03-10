class ChangeTeamsTypeInCompetitions < ActiveRecord::Migration
  def change
	change_column :competitions, :teams, :text
  end
end
