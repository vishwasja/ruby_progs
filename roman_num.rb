def convert_to_roman(num)
  nom = num / 1000; num %= 1000 if num > 1000
  noc = num / 100; num %=100 if num > 100
  nox = num / 10; num %=10 if num > 10
  noi = num
#  nod = 1; noc -= 4; csuf = true if noc <=> 4
 ## nol = 1; nox -= 4; xsuf = true if nox <=> 4
#  nov = 1; noi -= 4; isuf = true if noi <=> 4
  arr = []
  arr << ("M" * nom )
  arr << get_digits("C","D",noc)
  arr << get_digits("X","L",nox)
  arr << get_digits("I","V",noi)
  puts arr.join("")
end

def get_digits(char, x_char, num)
  case num <=> 4  
    when 0
      return (char + x_char)
    when -1
      return (char * num)
    when 1
      return (x_char + (char * (num-5)))
    else 
      return ""
    end
end

puts convert_to_roman(5691)
