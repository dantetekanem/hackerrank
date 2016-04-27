def anagram(string)
	return -1 if string.length.odd?
	changes = 0
	half = string.length / 2
	left = string[0...half].split('')
	right = string[half..-1].split('')

	left.each_with_index do |char|
		right.include?(char) ? right.delete_at(right.index(char)) : changes += 1
	end

	changes
end

strings = ["aaabbb", "ab", "abc", "mnop", "xyyx", "xaxbbbxx"]
strings.each { |string| puts anagram(string) }