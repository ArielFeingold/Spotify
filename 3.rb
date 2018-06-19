def change_possibilities(amount, denominations)

  result_arr = []
  i = denominations.length

# results from iterating through original array
  denominations.combination(2).each do |n|
    if n.reduce(:+) == amount
      result_arr << n
    end
  end

# results from multiplying each elemnt by itself
  denominations.each do |n|
    if n * 2 <= amount
      counter = 0
      arr = []
      while counter < amount
        arr << n
        counter += n
      end
      result_arr << arr
    end
  end

#results from different array elemnt combinations
  while i > 0
    arr = denominations.combination(i).to_a
    k = arr[0].product(*arr[1..-1]).select { |a| a.reduce(:+) == amount }
    if !k.empty?
      result_arr.concat(k)
    end
    i -= 1
  end
  result_arr.length
end
