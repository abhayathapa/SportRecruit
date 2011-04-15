require 'spec_helper'

describe Offer do
  it {should belong_to :athlete}
  it {should belong_to :recruiter}

  context "Offer created" do
    it "should create a new offer" do
      @ath = Person.make!(:person_type => "Athlete", :sport => "Ice Hockey")
      @rec = Person.make!(:person_type => "Recruiter", :sport => "Ice Hockey")

      Offer.create!(:recruiter_id =>@rec.recruiter.id, :athlete_id =>@ath.athlete.id)

      @ath.athlete.offers.count.should == 1
      @rec.recruiter.offers.count.should == 1
    end
  end

end

# == Schema Information
#
# Table name: offers
#
#  id           :integer         not null, primary key
#  recruiter_id :integer
#  athlete_id   :integer
#  created_at   :datetime
#  updated_at   :datetime
#

