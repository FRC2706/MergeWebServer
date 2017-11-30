class PicturesController < ApplicationController
	
	def create
		@team = Team.find_by(number: params[:team])
		if @team == nil
			render :text => "null"
			return
		end
		@comment = Picture.new(:team_id => @team[:id], :picture_type => params[:type], :link => params[:link]);
		@comment.save
		render :text => "success"
	end
	
end
