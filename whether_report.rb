require './day.rb'
class WhetherReport

	attr_reader :mo

	def initialize
		@monthly_forcast = []
		monthly_report = File.open("/home/cybage/miami-temperature.txt", "r")
		monthly_report.each_line do |day|
			day_arr = day.split
			@monthly_forcast << Day.new(day_arr[0],day_arr[1],day_arr[2])
		end
	end

	def day_with_max_temp_difference
		p monthly_forcast
	end

	def day_with_min_temp_difference
	end
end





WhetherReport.new.day_with_max_temp_difference
puts "Day #{} is the day in the month when the difference between the "
puts "maximum temperate and the minimum temperature was the highest."


# month
# 	has_many Days
# 		each day has_one day_number
# 		each day has_one max_temp
# 		each day has_one min_temp