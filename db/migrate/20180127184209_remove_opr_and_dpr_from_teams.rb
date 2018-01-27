class RemoveOprAndDprFromTeams < ActiveRecord::Migration[5.0]
  def change
	remove_column :teams, :opr
	remove_column :teams, :dpr
  end
end
