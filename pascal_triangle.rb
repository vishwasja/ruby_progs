puts "Enter the number of rows : "
rows = gets.to_i
a = [1]
b=[]
rows.times do |row|
    # a=b
  i=0; j=1
    	
  # puts a[j]
  while a[j] != nil do
  	temp = a
    # print 'here'
    # print a
    b[0] = a[0]
 	b[j] = a[i] + b[j]
 	i +=1
 	j = i+1
  end
  puts "a#{a}"
  puts "b#{b}"
  b << 1
  a=b
  print b
  puts
 
end