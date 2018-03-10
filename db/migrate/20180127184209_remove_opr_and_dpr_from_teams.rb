class RemoveOprAndDprFromTeams < ActiveRecord::Migration
  def change
	remove_column :teams, :opr
	remove_column :teams, :dpr
  end
end
