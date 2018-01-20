require 'net/https'
require 'json'

class SyncBlueAllianceJob < ActiveJob::Base
	queue_as :default
	
	$base_uri = 'https://www.bluealliance.com/api/v3'
	$api_key = 'I7YmubNkkgJsSsQSPGV2NcapPOceZWVUX5FHgtkLakc5bd02dW1BP71XLlufNmbz'
	$ssl_version = :TLSv1_2
	
	def competition_list(start_year, end_year)
		year = start_year
		competitions = []
		uri = URI.parse($base_uri + "/events/#{year}?")
		http = Net::HTTP.new(uri.host, uri.port)
		http.use_ssl = true
		http.ssl_version = $ssl_version
		http.verify_mode = OpenSSL::SSL::VERIFY_NONE
		request = Net::HTTP::Get.new(uri.request_uri)
		request['X-TBA-Auth-Key'] = $api_key
		response = http.request(request)
		while year < end_year?
			response = http.request(request)
			year++
			if response.success?
				competitions+= response.parsed_response
			end
		end
	end
	
	def team_list
		page = 0
		teams = []
		uri = URI.parse($base_uri + "/teams/#{page}")
		http = Net::HTTP.new(uri.host, uri.port)
		http.use_ssl = true
		http.ssl_version = $ssl_version
		request = Net::HTTP::Get.new(uri.request_uri)
		request['X-TBA-Auth-Key'] = $api_key
		response = http.request(request)
		while response.success and !response.parsed_response.empty do
			response = http.request(request)
			teams+= response.parsed_response
			page+= 1
		end
		teams
	end
	
	def perform(start_year, end_year)
		Team.delete_all
		Competition.delete_all
		competition_list(start_year, end_year).each do |tba_competition|
			competition = Competition.new(:name => tba_competition['name'], :location => tba_competition['location'], :start_date => tba_competition['start_date'], :end_date => tba_competition['end_date'])
			competition.save
		end
		team_list().each do |tba_team|
			team = Team.new(:name => tba_team['nickname'], :number => tba_team['team_number'])
			team.save
		end
	end
end
