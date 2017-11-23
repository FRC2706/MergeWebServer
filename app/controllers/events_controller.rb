class EventsController < ApplicationController
  def create
  end

  def list
    @events = Events.find_by(number: params[:id]);
    render :json => @events, :except => :id, :include => [:team, :goal]
  end
end
