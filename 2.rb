def decode_strings(s)
  arr = s.chars.collect! do |i|
    if /[0-9]/.match(i)
      i.to_i
    else
      i
    end
  end

  level = arr.count("[")
  result_arr = []


  while arr.length > 0
    if arr[0].class == Fixnum
      k = arr.take_while { |i| i.class == Fixnum}
      m = k.join.to_i
      result_arr << m
      arr = arr.drop_while { |i| i.class == Fixnum}
    elsif arr[0] == '['
      arr.shift
    elsif arr[0] == ']'
      arr.shift
    elsif arr[0].class == String
      k = arr.take_while { |i| i.class == String}
      k.delete(']')
      m = k.join
      result_arr << m
      arr = arr.drop_while { |i| i.class == String}
    end
  end

  t = result_arr.reverse

  while t.length > 2
    t[0] = t[0] * t[1]
    t.delete_at(1)
    t[0] = t[1] + t[0]
    t.delete_at(1)
  end
    result = t[0] * t[1]
end
