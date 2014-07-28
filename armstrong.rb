armstrong = []
(100..999).each do |num|
  num1 = num
  sum = 0
  3.times do 
    sum = sum + ((num % 10) ** 3)
    num = num/10
  end
  armstrong << num1 if sum == num1
end
puts armstrong
