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

	def team_list(event_key)
		response = self.class.get("/event/#{event_key}/teams/simple")
		response.parsed_response
	end
	
	def perform()
		old_logger = ActiveRecord::Base.logger
		ActiveRecord::Base.logger = nil
		Team.delete_all
		Competition.delete_all
		puts "Downloading events list..."
		events = event_list()
		puts "Adding events to database..."
		events_done = 0
		events.each do |tba_competition|
			teams = team_list(tba_competition['key'])
			teams2 = []
			teams.each do |tba_team|
				if !Team.exists?(number: tba_team['team_number'])
					team = Team.new(:name => tba_team['nickname'], :number => tba_team['team_number'], :opr => 0, :dpr => 0)
					team.save
				end
				teams2.push(tba_team['team_number'])
			end
			competition = Competition.new(:name => tba_competition['name'], :location => tba_competition['location_name'], :start_date => tba_competition['start_date'], :end_date => tba_competition['end_date'], :teams => teams2)
			competition.save
			events_done+= 1
			puts "Event " + events_done.to_s + "/" + events.size.to_s + " (" + (events_done.to_f / events.size * 100).round.to_s + "%)"
		end
		ActiveRecord::Base.logger = old_logger
	end
end
