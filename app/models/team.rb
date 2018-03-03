class Team < ActiveRecord::Base
	has_many :comments, foreign_key: 'team_key'
	has_many :pictures, foreign_key: 'team_key'
end
