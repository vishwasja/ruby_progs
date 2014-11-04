   def pattern(number)
     return if number <= 0
     0.upto(number-1) { |i|
       print " " * (number -  i) if (number - i) > 0
       puts "* " * (i + 1)
     } 
       
     (number-2).downto(0) { |i|
       print " " * (number - i)
       puts "* " * (i + 1)
    } 
   end
 pattern gets.chomp.to_i


   def rec_pattern(number,i=0,up_tri = true)
     return if number <= 0
     print " " * (number -  i) if (number - i) > 0
     puts "* " * (i + 1)
     if up_tri
       up_tri = false if number < (i+3)
       rec_pattern(number,i+1, up_tri) 
       
     else 
       rec_pattern(number,i-1,false) if number >= (i+1)
     end
    # 0.upto(number-1) { |i|
    #   print " " * (number -  i) if (number - i) > 0
    #   puts "* " * (i + 1)
    # } 
       
     #(number-2).downto(0) { |i|
     #  print " " * (number - i)
     #  puts "* " * (i + 1)
    #} 
   end
 rec_pattern gets.chomp.to_i
