class AddIds < ActiveRecord::Migration
  def self.up
     add_column :athletes, :person_id, :integer
     add_column :recruiters, :person_id, :integer
  end

  def self.down
    remove_column :athletes, :person_id, :integer
    remove_column :recruiters, :person_id, :integer
  end
end
