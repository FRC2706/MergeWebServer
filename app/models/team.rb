class Team < ActiveRecord::Base
	has_many :comments
	has_many :pictures
end
