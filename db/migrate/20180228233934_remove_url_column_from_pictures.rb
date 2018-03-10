class RemoveUrlColumnFromPictures < ActiveRecord::Migration
  def change
	remove_column :pictures, :link
  end
end
