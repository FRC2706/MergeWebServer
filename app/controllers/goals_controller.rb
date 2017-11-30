class GoalsController < ApplicationController
	
	def list
		@goals = Goal.select("name")
		render :json => @goals, :except => [:id]
	end
	
end
