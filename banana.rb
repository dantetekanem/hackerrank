class String
  def banana
    short_name = self[1, self.length]
    "#{self} #{self} Bo B#{short_name} Banana Fana Fo F#{short_name} Fee Fi Fo M#{short_name} #{self}!"
  end
end

puts "Jimmy".banana
puts "Bah".banana
puts "Rafa".banana
