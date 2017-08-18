def is_almost_palindrome(string)
	return -1 if string.length.odd?
	changes = 0
	half = string.length / 2
	left = string[0...half].split('')
	right = string[half..-1].split('')

	left.each_with_index do |char|
		right.include?(char) ? right.delete_at(right.index(char)) : changes += 1
	end

	changes <= 1 ? true : false
end

strings = ["abccba", "abccbx", "abccfg"]
strings.each { |string| puts is_almost_palindrome(string) }
