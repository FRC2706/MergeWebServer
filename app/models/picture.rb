class Picture < ActiveRecord::Base
	attr_accessible :data
	has_attached_file :data
end
