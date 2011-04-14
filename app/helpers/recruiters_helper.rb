module RecruitersHelper


  def check_offer(athlete,recruiter)
    if Offer.existing_offer(athlete,recruiter).size > 0
      content_tag :p do
        ["You have Already Offered !"].join(' ')
      end
    else
      content_tag :p do
        ["#{link_to 'Make an Offer', notification_recruiters_path(:id => athlete.id), :remote => true}"].join(' ').html_safe
      end
    end

  end


end

