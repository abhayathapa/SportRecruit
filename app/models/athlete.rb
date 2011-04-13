class Athlete < ActiveRecord::Base

  has_one :stat

  belongs_to :person

  def self.in_range(attribute, min, max )
    where("#{attribute} >= ? ", min).where("#{attribute} <= ?", max)
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

