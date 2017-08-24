require_relative "movies"
require_relative "easy_tests"

# Samples for test
die_hard = RegularMovie.new("Die Hard", 3)
dunkirk = NewReleaseMovie.new("Dunkirk", 2)
shrek = ChildrenMovie.new("Shrek", 2)
restricted = RestrictedMovie.new("Dark Movie", 4)

customer = Customer.new("Leonardo")
customer.add_movie(die_hard)
customer.add_movie(dunkirk)
customer.add_movie(shrek)
customer.add_movie(restricted)

# Test
easy = EasyTests.new
easy.assert_equal 3.5, die_hard.amount
easy.assert_equal 6, dunkirk.amount
easy.assert_equal 1.5, shrek.amount
easy.assert_equal 10, restricted.amount
easy.assert_equal 21, customer.total_amount
easy.assert_equal 8, customer.total_frequent_renter_points

easy.run
puts customer.statement
