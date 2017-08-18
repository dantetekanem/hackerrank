def maxDifference(a)
  max = a.max
  index = a.find_index(max) - 1
  return -1 if index < 0

  result = max - a[0..index].min
  result < 0 ? -1 : result
end

puts maxDifference([1,1,3,4,1,1,1,3])
