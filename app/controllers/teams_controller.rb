class TeamsController < ApplicationController
	def list
		@teams = Team.all
		respond_to do |format|
			format.html
			format.json {
				render :json => @teams, :except=> [:created_at, :updated_at]
			}
		end
	end

	def show
		@team = Team.find_by(number: params[:team]);
		respond_to do |format|
			format.html {
				@comments = Comment.where(team_key: @team.key);
				@pictures = Picture.where(team_key: @team.key);
				@matches = Match.find_by_sql("SELECT * FROM matches WHERE red1='" + @team.number.to_s + "' OR red2='" + @team.number.to_s + "' OR red3='" + @team.number.to_s + "' OR blue1='" + @team.number.to_s + "' OR blue2='" + @team.number.to_s + "' OR blue3='" + @team.number.to_s + "'");
			}
			format.json {
				render :json => @team, :except => [:created_at, :updated_at], :include => [{:comments => {:only => :body}}, {:pictures => {:only => [:picture_type, :taken_at, :link]}}]
			}
		end
	end
end
