require 'rake'
require 'httparty'
Dir[Rails.root + 'app/models/**/*.rb'].each do |path|
  require path
end
namespace :blue_alliance do
	task :import => :environment do
	
		class SyncBlueAllianceJob
			
			base_uri 'https://www.bluealliance.com/api/v2'
			headers 'X-TBA-App-Id' => 'frc2706:scout:v01'	# Is this really correct?
			
			def competition_list(start_year, end_year)
				year = start_year
				competitions = []
				response = self.class.get("/events/#{year}")
				while year < end_year?
					response = self.class.get("/events/#{year}")
					year++
					if response.success?
						competitions+= response.parsed_response
					end
				end
			end
			
			def team_list
				page = 0
				teams = []
				response = self.class.get("teams/#{page}")
				while response.success? && !response.parsed_response.empty?
					teams+= response.parsed_response
					page++
					response = self.class.get("/teams/#{page}")
				end
				teams
			end
			
			def perform(start_year, end_year)
				Teams.delete_all
				Competitions.delete_all
				competition_list(start_year, end_year).each do |tba_competition|
						competition = Competitions.new(:name => tba_competition['name'], :location => tba_competition['location'], :start_date => tba_competition['start_date'], :end_date => tba_competition['end_date'])
					competition.save
				end
				team_list().each do |tba_team|
					team = Teams.new(:name => tba_team['nickname'], :number => tba_team['team_number'])
					team.save
				end
			end
		end
		
		SyncBlueAllianceJob.new.perform(2017, 2017)
		
	end
end
