class SyncWithBlueAllianceJob < ActiveJob::Base
	include HTTParty

	base_uri 'https://www.thebluealliance.com/api/v3'
	headers 'X-TBA-Auth-Key' => 'I7YmubNkkgJsSsQSPGV2NcapPOceZWVUX5FHgtkLakc5bd02dW1BP71XLlufNmbz'

	def event_list(year = Time.now.year.to_s)
		response = self.class.get("/events/#{year}")
		if response.success?
			response.parsed_response
		end
	end

	def team_list()
		page = 0
		teams = []
		response = self.class.get("/teams/#{page}")
		while response.success? && !response.parsed_response.empty?
			teams += response.parsed_response
			page += 1
			response = self.class.get("/teams/#{page}")
		end
		teams
	end
	
	def perform()
		old_logger = ActiveRecord::Base.logger
		ActiveRecord::Base.logger = nil
		events = event_list()
		events_done = 0
		events.each do |tba_competition|
			competition = Competition.new(:name => tba_competition['name'], :location => tba_competition['location_name'], :start_date => tba_competition['start_date'], :end_date => tba_competition['end_date'])
			competition.save
			events_done+= 1
			puts "Event " + events_done.to_s + "/" + events.size.to_s + " (" + (events_done.to_f / events.size * 100).round.to_s + "%)"
		end
		puts "Downloading teams..."
		teams = team_list()
		teams_done = 0
		teams.each do |tba_team|
			team = Team.new(:name => tba_team['nickname'], :number => tba_team['team_number'], :opr => 0, :dpr => 0)
			team.save
			teams_done+= 1
			puts "Team " + teams_done.to_s + "/" + teams.size.to_s + " (" + (teams_done.to_f / teams.size * 100).round.to_s + "%)"
		end
		ActiveRecord::Base.logger = old_logger
	end
end
