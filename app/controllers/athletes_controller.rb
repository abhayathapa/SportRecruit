class AthletesController < ApplicationController

  before_filter :authenticate_person!

  def index
    @athlete = current_person.athlete
    if @athlete.gender == nil || @athlete.gender == ""
      flash[:notice] = "Gender CANNOT be Empty !!"
      render "_personal_info"
    end
  end

  def edit
    @athlete = current_person.athlete
  end

  def update
    @athlete = current_person.athlete
    if @athlete.update_attributes(params[:athlete])
      flash[:notice] = "Athlete Info was Successfully Updated."
      redirect_to athletes_path
    else
      render "edit", :notice => "Unable to Update. Try again. "
    end
  end

  # def destroy
  #   @athlete = current_person.athlete
  #   @athlete.destroy
  #   redirect_to new_person_registration_path
  # end

end
