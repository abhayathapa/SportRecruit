class CreateStats < ActiveRecord::Migration
  def self.up
    create_table :stats do |t|
      t.integer :athlete_id
      t.integer :matches
      t.integer :wins
      t.integer :losses
      t.integer :goals
      t.integer :assists
      t.integer :cleansheets
      t.string :position

      t.timestamps
    end
  end

  def self.down
    drop_table :stats
  end
end
