class Event < ActiveRecord::Base
	belongs_to :goal
	belongs_to :team
	belongs_to :match
end
