# v1
def caesar_cipher(text, key = 1)
  letters = "ABCDEFGHIJKLMNOPQRSTUVXWYZ"
  new_phrase = ""
  text.each_char do |char|
    next unless letters.include?(char)
    index = letters.index(char) + key
    new_phrase << letters[index, 1]
  end
  new_phrase
end

# v2
def caesar_cipher(text, key = 3)
  text.split("").map { |l| (l.ord + key).chr }.join
end
