class MatchesController < ApplicationController

	def show
		@competition = Competition.find_by(key: params[:competition])
		if @competition == nil
			render :text => "null"
			return
		end
		@match = Match.find_by(competition_key: @competition[:key], key: params[:match])
		respond_to do |format|
			format.html
			format.json {
				render :json => @match, :except => [:created_at, :updated_at], :include => {:events => {:except => [:created_at, :updated_at, :goal, :extra, :team_id], :include => {:team => {:only => [:number]}}}}
			}
		end
	end
end
