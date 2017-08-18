# One line fizz buzz
result = (1..100).map { |n| n % 15 == 0 ? "FizzBuzz" : (n % 5 == 0 ? "Buzz" : (n % 3 == 0 ? "Fizz" : n)) }
p result
