class Dictionary
  attr_reader :words

  def initialize(words)
    @words = words
  end

  def levenshtein_distance(a, b)
    a, b = a.downcase, b.downcase
    costs = Array(0..b.length)
    (1..a.length).each do |i|
      costs[0], nw = i, i - 1
      (1..b.length).each do |j|
        costs[j], nw = [costs[j] + 1, costs[j-1] + 1, a[i-1] == b[j-1] ? nw : nw + 1].min, costs[j]
      end
    end
    costs[b.length]
  end

  def find_most_similar(term)
    words.min_by { |word| levenshtein_distance(term, word) }
  end
end

words = ['cherry', 'peach', 'pineapple', 'melon', 'strawberry', 'raspberry', 'apple', 'coconut', 'banana']
test_dict = Dictionary.new(words)
puts test_dict.find_most_similar('strawbery').inspect
