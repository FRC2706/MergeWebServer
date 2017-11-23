class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :name
      t.integer :number
      t.integer :opr
      t.integer :dpr
      
      t.timestamps
    end
  end
end
