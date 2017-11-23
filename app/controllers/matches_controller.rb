class MatchesController < ApplicationController
  def list
  	@matches = Match.find_by(competition_id: params[:competition]);
  	render :json => @matches, :only => :match_number
  end

  def show
  	@match = Match.find_by(competition_id: params[:competition], match_number: params[:match]);
  	render :json => @match, :except => :id, :include => :events
  end
end
