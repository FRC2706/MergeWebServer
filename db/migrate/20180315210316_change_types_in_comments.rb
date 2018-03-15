class ChangeTypesInComments < ActiveRecord::Migration
  def change
	change_column :comments, :team_key, :string
  end
end
