def fib(n)
  if n >= 0
  	return 0 if n == 0
  	return 1 if n == 1
    res = f2 = f1 = 1
      (3..n).each do |num|
        res = f1 + f2
        f1 = f2
        f2 = res
    end
  else 
  	return 1 if n == -1
  	return -1 if n == -2
    f1, f2 = 1, -1
    (n..(-3)).each do |num|
      res = f1 - f2
      f1 = f2
      f2 = res
    end
  end
  res
end

p fib(gets.chomp.to_i)
