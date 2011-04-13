class CreateRecruiters < ActiveRecord::Migration
  def self.up
    create_table :recruiters do |t|
      t.string :nickname
      t.date :establishment
      t.string :country
      t.string :coach

      t.timestamps
    end
  end

  def self.down
    drop_table :recruiters
  end
end
