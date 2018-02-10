class MoreBaKeyStuff < ActiveRecord::Migration[5.0]
	def change
		change_column :teams, :id, :string
		rename_column :teams, :id, :key
	end
end
