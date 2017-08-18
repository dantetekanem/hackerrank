def to_leet(string)
  codes = {
    "a" => ["4", "@"],
    "b" => ['|3', '8'],
    "d" => ['|)', 'o|'],
    "e" => ['3'],
    "f" => ['|='],
    "g" => ['9', '6'],
    "h" => ['|-|', ']-[', '}-{', '(-)', ')-(', '#'],
    "i" => ['1', '!', ']['],
    "j" => ['_|'],
    "k" => ['|<', '|{'],
    "l" => ['|_'],
    "n" => ['|\|'],
    "o" => ['0'],
    "p" => ['|2', '|D'],
    "q" => ['(,)'],
    "r" => ['|Z', '|?'],
    "s" => ['5', '$'],
    "t" => ['+', '7'],
    "v" => ['|/', '\/'],
    "w" => ['\^/', '//'],
    "x" => ['><', '}{'],
    "y" => ['`/'],
    "z" => ['(\)']
  }

  encoded = ""
  string.downcase.each_char do |char|
    if codes.include?(char)
      encoded << codes[char][0]
      codes[char].rotate!
    else
      encoded << char
    end
  end

  encoded
end

puts to_leet("Leonardo")
