class TeamsController < ApplicationController
  def list
    @teams = Team.all
    render :json => @teams, :except=> [:created_at, :updated_at]
  end

  def show
  	@team = Team.find_by(number: params[:team]);
  	render :json => @team, :except => [:created_at, :updated_at], :include => [{:comments => {:only => :body}}, {:pictures => {:only => [:picture_type, :taken_at, :link]}}]
  end
end
