puts "Enter a number"
num = gets.to_i
fac = num
(2..(num-1)).map { |num1|	fac *= num1 }
puts "Factorial of #{num} is #{fac}"