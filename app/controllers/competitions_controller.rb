class CompetitionsController < ApplicationController
  def list
  	@competitions = Competition.select("name")
    render :json => @competitions, :except => [:id]
  end

  def show
  	@competition = Competition.find_by(name: params[:competition]);
  	render :json => @competition, :except => :id, :include => :matches
  end
end
