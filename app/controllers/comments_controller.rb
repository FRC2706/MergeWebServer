class CommentsController < ApplicationController
	
	def create
		@team = Team.find_by(number: params[:team])
		if @team == nil
			render :text => "null"
			return
		end
		@comment = Comment.new(:team_id => @team[:id], :body => params[:body]);
		@comment.save
		render :text => "success"
	end
	
end
