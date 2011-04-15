class Athlete < ActiveRecord::Base

  has_one :stat, :dependent => :destroy
  has_many :offers, :dependent => :destroy

  belongs_to :person

  def self.in_range(attribute, min, max )
    where("#{attribute} >= ? ", min).where("#{attribute} <= ?", max)
  end

  def self.age_range(min, max )
    where("dob<= ? ", (DateTime.now-min.to_i.years).to_date).where("dob >= ?", (DateTime.now-max.to_i.years).to_date)
  end

  def self.search_field(attribute, value )
    where("#{attribute} = ? ", value)
  end

end

# == Schema Information
#
# Table name: athletes
#
#  id         :integer         not null, primary key
#  dob        :date
#  gender     :string(255)
#  country    :string(255)
#  height     :integer
#  weight     :integer
#  created_at :datetime
#  updated_at :datetime
#  person_id  :integer
#

