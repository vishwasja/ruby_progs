arr = [23,43,54,65,76,878,34,23,23,54,67,7,687,23]
puts "Enter the number to be searched"
num = gets.to_i
flag = true
a = arr.select { |n| n unless n == num }
puts a
puts "number is present" unless arr.empty?
  
