class CreateOffers < ActiveRecord::Migration
  def self.up
    create_table :offers do |t|
      t.integer :recruiter_id
      t.integer :athlete_id
      t.string :status, :default => "Pending"

      t.timestamps
    end
  end

  def self.down
    drop_table :offers
  end
end
