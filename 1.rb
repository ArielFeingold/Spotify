def sort_by_strings(s,t)
  hash = Hash.new
  new_array = []

  t.chars.each_with_index { |item, index| hash[item] = index }

  s.chars.each do |letter|
    if hash.has_key?(letter)
      a = {letter => hash[letter]}
      new_array << a
    end
  end

  new_array.to_a
  j = new_array.map {|a| a.to_a}
  k = j.flatten(1)
  m = k.sort_by{|a| a[1]}
  return final = m.map {|i| i[0]}.join
end
