class TeamsController < ApplicationController
  def list
    @teams = Team.select("name", "number")
    render :json => @teams, :except => [:id]
  end

  def show
  	@team = Team.find_by(number: params[:team]);
  	render :json => @team, :except => [:id, :created_at, :updated_at], :include => [{:comments => {:only => :body}}, {:pictures => {:only => [:picture_type, :taken_at, :link]}}]
  end
end
