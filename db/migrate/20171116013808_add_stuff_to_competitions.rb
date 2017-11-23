class AddStuffToCompetitions < ActiveRecord::Migration
  def change
    add_column :competitions, :name, :string
    add_column :competitions, :location, :string
    add_column :competitions, :teams, :binary
  end
end
