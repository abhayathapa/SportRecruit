class AddPersonTypeToPeople < ActiveRecord::Migration
  def self.up
    add_column :people, :person_type, :string
  end

  def self.down
    remove_column :people, :person_type
  end
end
