class RenameTypeToPictureType < ActiveRecord::Migration
  def change
	rename_column :pictures, :type, :picture_type
  end
end
