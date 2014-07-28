puts "Enter a number to check whether it is prime or not"
num = gets.to_i
flag = true
(2..(num-1)).each { |n| flag = false if num % n == 0 }
puts flag ? "prime" : "not prime"
