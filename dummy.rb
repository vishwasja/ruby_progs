def fizz_buzz_custom(string_1 = 'Fizz', string_2 = 'Buzz', num_1 = 3, num_2 = 5)
  a = []
  (1...100).each do |i|
    case true
      when i % 3 == 0 
        a << string_1
      when i % 5 == 0
        a << string_2
      when (i % 3 == 0 && i % 5 == 0)
        a << string_1 + string_2
      else 
        a << i
      end
    end
    puts a
    a
end
puts fizz_buzz_custom[89]
