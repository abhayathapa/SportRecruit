class Offer < ActiveRecord::Base

  belongs_to :recruiter
  belongs_to :athlete

  def self.deal(athlete,recruiter)
    Offer.create!(:recruiter_id =>recruiter.id, :athlete_id =>athlete.id)
  end

  def self.existing_offer(athlete,recruiter)
    Offer.where("athlete_id = ?" , athlete.id).where("recruiter_id =?" , recruiter.id)
  end

  def self.respond_to_deal(athlete,recruiter,new_status)
    offer = Offer.where("athlete_id = ?" , athlete.id).where("recruiter_id =?" , recruiter.id)
    offer.first.update_attributes(:status => new_status)
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

