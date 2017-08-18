def average_from_points(a, b, c)
  dx = (c[:x] - b[:x] - a[:x]) ** 2
  dy = (c[:y] - b[:y] - a[:y]) ** 2

  Math.sqrt(dx + dy)
end

average = average_from_points({x: 5, y: 6}, {x: 10, y: 9}, {x: 20, y: 16})

puts "Average: #{average}"
