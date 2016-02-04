class Ritual < ActiveRecord::Base

	has_many :attendances
	has_many :users, :through => :attendances

	#is that right?
	belongs_to :user_turn, :class_name => "User", :foreign_key => "user_id"

	has_many :posts

	has_one :whiskey

	def self.date_of_next(day)
		date  = Date.parse(day)
		delta = date > Date.today ? 0 : 7
		date + delta
	end

	def self.next_ritual
		most_recent = Ritual.last

			if most_recent == nil
					Ritual.create(:date_of => self.date_of_next("Friday"))
					return
			else 
				if most_recent.date_of > Time.now 
					return most_recent
				else
					Ritual.create(:date_of => self.date_of_next("Friday"))
				end
			end

	end
end
