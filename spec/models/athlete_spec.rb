require 'spec_helper'

describe Athlete do
  it {should belong_to :person}
  it {should have_one :stat}
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

