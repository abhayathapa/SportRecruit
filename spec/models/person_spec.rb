require 'spec_helper'

describe Person do
  it {should have_one :athlete}
  it {should have_one :recruiter}

  it {should validate_presence_of :name}
  it {should validate_presence_of :sport}
  it {should validate_presence_of :person_type}

  context "Athlete/Recruiter created from Person" do
    it "should check person_type" do
      Person.make!(:person_type => "Athlete", :sport => "Ice Hockey")
      Person.first.sport.should == "Ice Hockey"

      Athlete.count.should == 1
      Stat.count.should == 1
      Person.first.person_type.should == "Athlete"
      Athlete.first.person_id.should == Person.first.id

      Recruiter.count.should == 0
      Person.first.person_type.should_not == "Recruiter"
    end
  end

end

# == Schema Information
#
# Table name: people
#
#  id                   :integer         not null, primary key
#  name                 :string(255)
#  sport                :string(255)
#  created_at           :datetime
#  updated_at           :datetime
#  email                :string(255)     default(""), not null
#  encrypted_password   :string(128)     default(""), not null
#  reset_password_token :string(255)
#  remember_created_at  :datetime
#  sign_in_count        :integer         default(0)
#  current_sign_in_at   :datetime
#  last_sign_in_at      :datetime
#  current_sign_in_ip   :string(255)
#  last_sign_in_ip      :string(255)
#  person_type          :string(255)
#

