class RemoveUrlColumnFromPictures < ActiveRecord::Migration[5.0]
  def change
	remove_column :pictures, :link
  end
end
