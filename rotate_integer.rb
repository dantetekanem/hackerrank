def sort_by_perfsq(arr)
  stack = {}
  arr.each do |number|
    permuts = number.to_s.chars.to_a.permutation.map(&:join).map(&:to_i).uniq
    perfects = permuts.map do |n|
      (Math.sqrt(n) % 1).zero? ? 1 : 0
    end.inject(:+)

    if stack[perfects.to_s].nil?
      stack[perfects.to_s] = [number]
    else
      stack[perfects.to_s] << number
    end
  end

  stack.sort_by { |k, v| k.to_i }.reverse.map { |n| n[1].sort }.flatten
end

puts sort_by_perfsq([715, 112, 136, 169, 144]).inspect
