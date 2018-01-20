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

  def team_list
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
end
