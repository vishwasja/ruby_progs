def right_shift arr,n
  temp = arr.reverse.shift(n)
  (arr - temp).unshift(temp.reverse).flatten
end

p right_shift([1,2,3,4,5,6],gets.chomp.to_i)

