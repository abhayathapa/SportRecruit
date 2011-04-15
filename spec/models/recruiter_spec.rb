require 'spec_helper'

describe Recruiter do
  it {should belong_to :person}
  it {should have_many :offers}
end

# == Schema Information
#
# Table name: recruiters
#
#  id            :integer         not null, primary key
#  nickname      :string(255)
#  establishment :date
#  country       :string(255)
#  coach         :string(255)
#  created_at    :datetime
#  updated_at    :datetime
#  person_id     :integer
#

