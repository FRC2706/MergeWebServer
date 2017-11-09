class Competition < ActiveRecord::Base
  serialize :teams, Array
end
