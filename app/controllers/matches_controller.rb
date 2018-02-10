class MatchesController < ApplicationController

	def show
		@competition = Competition.find_by(key: params[:competition])
		if @competition == nil
			render :text => "null"
			return
		end
		@match = Match.find_by(competition_key: @competition[:key], key: params[:match])
		render :json => @match, :except => [:created_at, :updated_at], :include => {:events => {:except => [:created_at, :updated_at, :goal, :extra]}}
	end
end
