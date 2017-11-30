class CompetitionsController < ApplicationController
	def list
		@competitions = Competition.select("name")
		render :json => @competitions, :only => :name
	end
	
	def show
		@competition = Competition.find_by(name: params[:competition]);
		render :json => @competition, :except => [:id, :created_at, :updated_at], :include => {:matches => {:only => :match_number}}
	end
end
