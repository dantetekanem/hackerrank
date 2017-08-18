def most_popular_number(numbers, arr_size)
  return numbers.first if arr_size == 1

  appears = {}
  numbers.each do |number|
    if appears.include?(number.to_s)
      appears[number.to_s] += 1
    else
      appears[number.to_s] = 1
    end
  end

  sorted_appears = appears.sort_by { |t| t[1] }
  most_popular = sorted_appears.slice!(-1)
  if most_popular[1] == sorted_appears[-1][1]
    most_popular = most_popular[0].to_i > sorted_appears[-1][0].to_i ? sorted_appears[-1] : most_popular
  end

  most_popular[0]
end

puts most_popular_number [34, 31, 34, 77, 82], 5
puts most_popular_number [22, 101, 102, 101, 102, 525, 88], 7
puts most_popular_number [66], 1
puts most_popular_number [14, 14, 2342, 2342, 2342], 5
