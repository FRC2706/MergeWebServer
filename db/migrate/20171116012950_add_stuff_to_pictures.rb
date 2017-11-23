class AddStuffToPictures < ActiveRecord::Migration
  def change
    add_column :pictures, :team_id, :integer
    add_column :pictures, :type, :string
    add_column :pictures, :taken_at, :datetime
    add_column :pictures, :link, :string
  end
end
