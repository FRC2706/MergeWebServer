class CompetitionsController < ApplicationController
	def list
		@competitions = Competition.all
		respond_to do |format|
			format.html
			format.json {
				render :json => @competitions, :only => [:key, :name]
			}
		end
	end
	
	def show
		@competition = Competition.find_by(key: params[:competition]);
		respond_to do |format|
			format.html {
				@matches = Match.where(:competition_key => @competition.key);
			}
			format.json {
				render :json => @competition, :except => [:created_at, :updated_at], :include => {:matches => {:only => [:match_number, :key]}}
			}
		end
	end
end
