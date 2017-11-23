class AddStuffToMatches < ActiveRecord::Migration
  def change
    add_column :matches, :blue1, :int
    add_column :matches, :blue2, :int
    add_column :matches, :blue3, :int
    add_column :matches, :red1, :int
    add_column :matches, :red2, :int
    add_column :matches, :red3, :int
    add_column :matches, :competition_id, :int
    add_column :matches, :start_time, :datetime
    add_column :matches, :match_number, :int
  end
end
