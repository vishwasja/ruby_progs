def permutate num
return if num > 10
alphabet_arr = ['a','b','c','d','e','f','g','h','i']
inp_alphabet = alphabet_arr[0..(num-1)]
inp_alphabet.permutation.map(&:join)
end
puts "Enter number of charaters to be permuted"
puts permutate num = gets.chomp.to_i
