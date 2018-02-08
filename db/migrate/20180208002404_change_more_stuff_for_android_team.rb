class ChangeMoreStuffForAndroidTeam < ActiveRecord::Migration[5.0]
	def change
		change_column :events, :start_time, :int
		change_column :events, :end_time, :int
	end
end
