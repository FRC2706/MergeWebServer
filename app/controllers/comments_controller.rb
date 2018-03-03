class CommentsController < ApplicationController
	
	def create
		@team = Team.find_by(number: params[:team])
		if @team == nil
			render :text => "null"
			return
		end
		@comment = Comment.new(:team_key => @team[:key], :body => params[:body]);
		@comment.save
		respond_to do |format|
			format.html {
				redirect_to :controller => :teams, :action => :show, :team => @team.number
			}
			format.json {
				render :text => "success"
			}
		end
	end
	
	def new
		@team = Team.find_by(number: params[:team])
	end
end
