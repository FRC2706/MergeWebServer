class MatchesController < ApplicationController

	def show
		@competition = Competition.find_by(name: params[:competition])
		if @competition == nil
			render :text => "null"
			return
		end
		@match = Match.find_by(competition_id: @competition[:id], match_number: params[:match])
		render :json => @match, :except => [:id, :created_at, :updated_at, :competition_id], :include => {:events => {:except => [:created_at, :updated_at, :id, :team_id, :match_id, :goal_id, :extra], :include => {:goal => {:only => :name}}}}
	end
end
