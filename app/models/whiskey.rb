class Whiskey < ActiveRecord::Base

	has_many :rituals
	has_many :posts
end
