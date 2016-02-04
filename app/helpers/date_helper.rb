require 'date'

module DateHelper
	

	def date_pretty(b)
		new_date = "#{b.strftime("%A")}, the #{b.strftime("%d")} of #{b.strftime("%B")}"
		return new_date
	end

	def time_n_day(a)
		b = Time.zone.at(a)
		new_time = "#{b.strftime("%I")}:#{b.strftime("%M")} #{b.strftime("%p").downcase} #{b.strftime("%m")}/#{b.strftime("%d")}"
		return new_time
	end


end
