module AthletesHelper

  def view_offers(athlete,recruiter)
    if Offer.existing_offer(athlete,recruiter).where("status = ?", "Pending").size > 0
      content_tag :p do
        [
          "#{link_to 'Accept', notification_athletes_path(:id => recruiter.id, :status => "Accepted"), :remote => true}",
          "#{link_to 'Reject', notification_athletes_path(:id => recruiter.id, :status => "Rejected"), :remote => true}"
          ].join(' ').html_safe
        end
    else
      content_tag :p do
         ["Offer #{recruiter.offers.where("athlete_id= ?", athlete.id).first.status}!"].join(' ')
       end
    end
  end

  def get_age(athlete)
    (DateTime.now.to_date - athlete.dob).to_i/365
  end
end
