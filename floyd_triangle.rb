# Write a program to generate following floyd's triangle
# 	1
# 	2 3
# 	4 5 6
# 	7 8 9 10
# 	11 12 13 14 15

i = 1	
(1..5).each do |j|
  j.times do
    print "#{i} "
    i +=1
  end
  print "\n"
end