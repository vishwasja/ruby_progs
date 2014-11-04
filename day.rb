class Day

	attr_reader :day_num, :max_temp, :min_temp, :temp_diff

	def initialize day_num,max_temp,min_temp
		@day_num, @max_temp, @min_temp = day_num, max_temp, min_temp
		@temp_diff = max_temp - min_temp
	end

end