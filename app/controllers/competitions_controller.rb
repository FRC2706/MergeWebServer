class CompetitionsController < ApplicationController
	def list
		@competitions = Competition.all
		render :json => @competitions, :only => [:key, :name]
	end
	
	def show
		@competition = Competition.find_by(key: params[:competition]);
		render :json => @competition, :except => [:created_at, :updated_at], :include => {:matches => {:only => [:match_number, :key]}}
	end
end
