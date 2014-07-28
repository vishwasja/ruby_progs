puts "Enter a binary number : "
num = gets.to_i
dec_num = i = 0
until num == 0 do
  dec_num += (num % 10) * (2 ** i) 
  num /= 10
  i += 1
end 
puts dec_num
