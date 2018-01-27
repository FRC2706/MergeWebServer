class EventsController < ApplicationController
	
	def create
		@team = Team.find_by(number: params[:team])
		@competition = Competition.find_by(name: params[:competition]);
		if @competition == nil || @team == nil || @goal == nil
			render :text => "null"
			return
		end
		@match = Match.find_by(competition_id: @competition[:id], match_number: params[:match])
		if @match == nil
			render :text => "null"
			return
		end
		@comment = Event.new(:team_id => @team[:id], :match_id => @match[:id], :goal => params[:goal], :success => params[:success], :start_time => params[:start], :end_time => params[:end], :extra => params[:extra])
		@comment.save
		render :text => "success"
	end
	
end
