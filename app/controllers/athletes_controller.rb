class AthletesController < ApplicationController

  before_filter :authenticate_person!

  def index
    @athlete = current_person.athlete
    if @athlete.dob == nil
      render "_personal_info"
    end
  end

  def edit
    @athlete = current_person.athlete
  end

  def update
    @athlete = current_person.athlete
    if @athlete.update_attributes(params[:athlete])
      redirect_to athletes_path, :notice => "Athlete info was successfully updated."
    else
      render "edit", :notice => "Unable to update. Try again. "
    end
  end

  # def destroy
  #   @athlete = current_person.athlete
  #   @athlete.destroy
  #   redirect_to new_person_registration_path
  # end

end
