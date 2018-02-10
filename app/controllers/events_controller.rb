class EventsController < ApplicationController
	
	def create
		@team = Team.find_by(number: params[:team])
		@competition = Competition.find_by(key: params[:competition]);
		if !@competition || !@team
			render :text => "null"
			return
		end
		@match = Match.find_by(competition_key: @competition[:key], key: params[:match])
		if @match == nil
			render :text => "null"
			return
		end
		@event = Event.new(:team_key => @team[:key], :match_key => @match[:key], :goal => params[:goal], :success => params[:success], :start_time => params[:start], :end_time => params[:end], :extra => params[:extra])
		@event.save
		render :text => "success"
	end
	
end
