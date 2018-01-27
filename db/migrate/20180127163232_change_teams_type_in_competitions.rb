class ChangeTeamsTypeInCompetitions < ActiveRecord::Migration[5.0]
  def change
	change_column :competitions, :teams, :text
  end
end
