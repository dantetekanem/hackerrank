require_relative "movies"
require_relative "easy_tests"

# Samples for test
die_hard = RegularMovie.new("Die Hard")
dunkirk = NewReleaseMovie.new("Dunkirk")
shrek = ChildrenMovie.new("Shrek")

rental_one = Rental.new(die_hard, 3)
rental_two = Rental.new(dunkirk, 2)
rental_three = Rental.new(shrek, 2)

customer = Customer.new("Leonardo")
customer.add_rental(rental_one)
customer.add_rental(rental_two)
customer.add_rental(rental_three)

# Test
easy = EasyTests.new
easy.assert_equal 3.5, rental_one.amount
easy.assert_equal 6, rental_two.amount
easy.assert_equal 1.5, rental_three.amount
easy.assert_equal 11, customer.total_amount
easy.assert_equal 4, customer.frequent_renter_points

easy.run
puts customer.statement
