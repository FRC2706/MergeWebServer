class Match < ActiveRecord::Base
	self.primary_key = 'key'
	has_many :events
end
