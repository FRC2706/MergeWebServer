class Competition < ActiveRecord::Base
	self.primary_key = 'key'
	serialize :teams, Array
	has_many :matches, foreign_key: 'competition_key'
end
