class MoreBaKeyStuff < ActiveRecord::Migration
	def change
		change_column :teams, :id, :string
		rename_column :teams, :id, :key
	end
end
