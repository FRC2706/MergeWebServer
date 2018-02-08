class BaKeyStuff < ActiveRecord::Migration[5.0]
	def change
		change_column :competitions, :id, :string
		rename_column :competitions, :id, :key
		change_column :matches, :id, :string
		rename_column :matches, :id, :key
		change_column :matches, :competition_id, :string
		rename_column :matches, :competition_id, :competition_key
		change_column :events, :match_id, :string
		rename_column :events, :match_id, :match_key
	end
end
