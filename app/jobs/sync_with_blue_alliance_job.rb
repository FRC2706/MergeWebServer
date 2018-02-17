# WARNING: This entire system is not very efficient. Use with caution.
class SyncWithBlueAllianceJob < ActiveJob::Base
	include HTTParty
	
	base_uri 'https://www.thebluealliance.com/api/v3'
	headers 'X-TBA-Auth-Key' => 'I7YmubNkkgJsSsQSPGV2NcapPOceZWVUX5FHgtkLakc5bd02dW1BP71XLlufNmbz'
	
	def event_list(team_key, year = 2017)
		response = self.class.get("/team/#{team_key}/events/#{year}/simple")
		if response.success?
			response.parsed_response
		end
	end

	def team_list(event_key)
		response = self.class.get("/event/#{event_key}/teams/simple")
		response.parsed_response
	end
	
	def match_list(event_key)
		response = self.class.get("/event/#{event_key}/matches/simple")
		response.parsed_response
	end
	
	def get_team(team_key)
		response = self.class.get("/team/#{team_key}/simple")
		response.parsed_response
	end
	
	def get_competition(competition_key)
		response = self.class.get("/event/#{competition_key}/simple")
		response.parsed_response
	end
	
	# Just discovered that Gedit & Ruby supports emojis so I'm going to make my code really, really ugly. I'll probably fix it later
	def perform(team_number👌)
		ActiveRecord::Base.logger = nil
		Team.delete_all
		Competition.delete_all
		Match.delete_all
		puts "Downloading events list..."
		events👌 = event_list("frc" + team_number👌)
		puts "Adding events to database..."
		matches👌 = []
		events👌.each_with_index do |tba_competition👌, index👌|
			matches👌+= match_list(tba_competition👌['key'])
			teams👌 = team_list(tba_competition👌['key'])
			teams👌.each do |tba_team👌|
				team👌 = Team.find_or_create_by(:key => tba_team👌['key'], :name => tba_team👌['nickname'], :number => tba_team👌['team_number'])
				team👌.save!
			end
			teams👌 = teams👌.map{|x👌| x👌["team_number"]}
			competition👌 = Competition.new(:key => tba_competition👌['key'], :name => tba_competition👌['name'], :location => tba_competition👌['location_name'], :start_date => tba_competition👌['start_date'], :end_date => tba_competition👌['end_date'], :teams => teams👌)
			competition👌.save!
			puts "Event " + index👌.to_s + "/" + events👌.size.to_s + " (" + (index👌.to_f / events👌.size * 100).round.to_s + "%)"
		end
		sync_matches(matches👌)
	end
	def sync_matches(matches👌)
		puts "Adding matches to database..."
		matches👌.each_with_index do |tba_match👌, index👌|
			match_teams👌 = []
			teams👌 = tba_match👌['alliances']['blue']['team_keys'] + tba_match👌['alliances']['blue']['team_keys']
			teams👌.each_with_index do |tba_team_key👌, index👌|
				tba_team👌 = get_team(tba_team_key👌)
				match_teams👌[index👌] = tba_team👌['team_number']
			end
			if tba_match👌['actual_time']
				start_time👌 = tba_match👌['actual_time']
			else
				start_time👌 = tba_match👌['time']
			end
			match👌 = Match.new(:key => tba_match👌['key'], :competition_key => tba_match👌['event_key'], :match_number => tba_match👌['match_number'], :start_time => start_time👌, :blue1 => match_teams👌[1], :blue2 => match_teams👌[2], :blue3 => match_teams👌[3], :red1 => match_teams👌[4], :red2 => match_teams👌[5], :red3 => match_teams👌[6])
			match👌.save!
			puts "Match " + index👌.to_s + "/" + matches👌.size.to_s + " (" + (index👌.to_f / matches👌.size * 100).round.to_s + "%)"
		end
	end
end
