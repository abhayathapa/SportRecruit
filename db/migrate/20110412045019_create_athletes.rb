class CreateAthletes < ActiveRecord::Migration
  def self.up
    create_table :athletes do |t|
      t.date :dob
      t.string :gender
      t.string :country
      t.integer :height
      t.integer :weight

      t.timestamps
    end
  end

  def self.down
    drop_table :athletes
  end
end
