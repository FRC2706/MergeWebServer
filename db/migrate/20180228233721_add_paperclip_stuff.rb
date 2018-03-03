class AddPaperclipStuff < ActiveRecord::Migration[5.0]
  def self.up
	add_attachment :pictures, :data
  end

  def self.down
	remove_attachment :pictures, :data
  end
end
