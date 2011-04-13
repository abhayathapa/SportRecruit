class PeopleController < ApplicationController

  before_filter :authenticate_person!

  def index
    if current_person.person_type == "Athlete"
      redirect_to athletes_path
    else
      redirect_to recruiters_path
    end
  end

end
