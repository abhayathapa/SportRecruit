class RecruitersController < ApplicationController

  before_filter :authenticate_person!

  def index
    @recruiter = current_person.recruiter
    if params[:search]
      @people = Person.search(params[:search])
    end

    if @recruiter.coach == nil || @recruiter.coach == ""
      flash[:notice] = "Update your Profile (at least Coach Required) !!"
      render "_form"
    end
  end

  def edit
    @recruiter = current_person.recruiter
  end

  def update
    @recruiter = current_person.recruiter
    if @recruiter.update_attributes(params[:recruiter])
      flash[:notice] = "Recruiter info was successfully updated."
      redirect_to recruiters_path
    else
      flash[:notice] = "Unable to update. Try again. "
      render "edit"
    end
  end

  def advanced_search
    @athletes = Athlete.all
    @recruiter = current_person.recruiter

    if params[:gender]
      @searched_athletes = Athlete.age_range( params[:age_min], params[:age_max] ).in_range("weight", params[:weight_min], params[:weight_max] ).in_range("height", params[:height_min], params[:height_max] ).search_field("gender", params[:gender])
    end
    if params[:country]!= ""
      @searched_athletes = Athlete.age_range( params[:age_min], params[:age_max] ).in_range("weight", params[:weight_min], params[:weight_max] ).in_range("height", params[:height_min], params[:height_max] ).search_field("gender", params[:gender]).search_field("country", params[:country])
    end
  end

  def notification
    @athlete = Athlete.find(params[:id])
    @recruiter = current_person.recruiter
    Offer.deal(@athlete,@recruiter)
    respond_to  do |format|
      format.html{redirect_to advanced_search_recruiters_path, flash[:notice] = "#{@athlete.person.name} has an offer from #{@recruiter.person.name}"}
      format.js
    end
  end

  def my_offers
    @recruiter = current_person.recruiter
  end


end
