class AddExtraColumnToEvents < ActiveRecord::Migration[5.0]
  def change
	add_column :events, :extra, :text
  end
end
