class RecruitersController < ApplicationController

  before_filter :authenticate_person!

  def index
    @recruiter = current_person.recruiter
    if params[:search]
      @people = Person.search(params[:search])
    end

    if @recruiter.coach == nil
      render "_form", :notice => "Coach is Required ! "
    end
  end

  def edit
    @recruiter = current_person.recruiter
  end

  def update
    @recruiter = current_person.recruiter
    if @recruiter.update_attributes(params[:recruiter])
      redirect_to recruiters_path, :notice => "Recruiter info was successfully updated."
    else
      render "edit", :notice => "Unable to update. Try again. "
    end
  end

  def advanced_search
    @athletes = Athlete.all
    @recruiter = current_person.recruiter

    if params[:weight_min] && params[:weight_max] && params[:height_min] && params[:height_max]
      @searched_athletes = Athlete.in_range("weight", params[:weight_min], params[:weight_max]).in_range("height", params[:height_min], params[:height_max])
    elsif params[:weight_min] && params[:weight_max]
      @searched_athletes = Athlete.in_range(weight, :weight_min, :weight_max)
    end

  end

end
