prices = [4,9,2,3]

def calculateAmount(prices)
  discount = prices[0]

  discount + prices[1..-1].map do |price|
    discount = price if price < discount
    discount > price ? 0 : price - discount
  end.inject(:+)
end

puts calculateAmount(prices)
puts calculateAmount([1,2,3,4])
