class Competition < ActiveRecord::Base
	serialize :teams, Array
	has_many :matches
end
