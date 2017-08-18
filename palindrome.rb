def palindrome_index(string)
  return -1 if string == string.reverse

  string.each_char.with_index do |char, index|
    cp_string = string.dup
    cp_string.slice!(index)
    return index if cp_string.reverse == cp_string
  end
end

input = ['aaab', 'baa', 'aaa', 'quyjjdcgsvvsgcdjjyq', 'hgygsvlfwcwnswtuhmyaljkqlqjjqlqkjlaymhutwsnwcflvsgygh', 'fgnfnidynhxebxxxfmxixhsruldhsaobhlcggchboashdlurshxixmfxxxbexhnydinfngf']
input.each { |string| puts palindrome_index(string) }
