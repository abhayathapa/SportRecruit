class StatsController < ApplicationController

  def index
    @athlete = current_person.athlete
    @stat = @athlete.stat

  end

  def edit
    @athlete = current_person.athlete
    @stat = @athlete.stat

    @sport_position = position_evaluate(current_person)
  end

  def update
    @athlete = current_person.athlete
    @stat = @athlete.stat
    if @stat.update_attributes(params[:stat])
      flash[:notice] = "Athlete Stats was Successfully Updated."
      redirect_to athletes_path
    else
      render "edit", :notice => "Unable to Update. Try again. "
    end
  end


  private

  def position_evaluate(person)
    if person.sport == "Football"
       ["Goalkeeper","Defence","Mid-Field","Striker"]
    elsif person.sport == "Ice Hockey"
       ["Goalie","Player"]
    else person.sport =="American Football"
       ["Defence","Kicker","Punter","Quarter-Back","Running-Back"]
    end
  end


end
