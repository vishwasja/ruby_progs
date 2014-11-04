puts "Enter decimal number"
num = gets.to_i
i = bin_num = 0
until num == 0 do
  bin_num += ((num % 2) * (10 ** i))
  num /=2
  i += 1
end
puts bin_num  


####### num.to_s(2).to_i
