class EventsController < ApplicationController
	
	def create
		@team = Team.find_by(number: params[:team])
		@event = Event.new(:team_key => @team[:key], :match_key => params[:match], :goal => params[:goal], :success => params[:success], :start_time => params[:start], :end_time => params[:end], :extra => params[:extra])
		@event.save
		render :text => "success"
	end
	
end
