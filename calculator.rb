class FloatToken
  attr_reader :value

  def initialize(value)
    @value = value.to_f
  end
end

class OperatorToken
  attr_reader :value

  def initialize(value)
    @value = value
  end
end

class BigOperatorToken
  attr_reader :value

  def initialize(value)
    @value = value
  end
end

class IgnoreToken; end

class LexicalAnalyzer
  def self.tokenize(expression)
    definitions = [
      [/^[-]?[0-9]*\.?[0-9]+/, FloatToken],
      [/^\+/, OperatorToken],
      [/^\-/, OperatorToken],
      [/^\*/, BigOperatorToken],
      [/^\//, BigOperatorToken],
      [/\s+/, IgnoreToken]
    ]

    tokens = []
    last_size = 0
    unfrozen_expression = expression.dup

    while unfrozen_expression.size != last_size
      last_size = unfrozen_expression.size
      definitions.each do |regex, token_type|
        lexical = unfrozen_expression.slice!(regex)
        if lexical
          tokens << token_type.new(lexical) unless token_type == IgnoreToken
          break
        end
      end
    end

    tokens
  end
end

class Calculator
  def operate(number_a, number_b, operation)
    number_a = number_a == "-" ? -1 : 1 if !number_a.is_a?(Numeric)

    case operation
    when "+" then number_a + number_b
    when "-" then number_a - number_b
    when "*" then (number_a * number_b)
    when "/" then (number_a / number_b)
    end
  end

  def calculate(expressions)
    result = 0.0
    state = nil

    while expressions.any?
      if expressions.any? { |exp| exp == "*" || exp == "/" }
        index = expressions.index { |i| i == "*" || i == "/" }
        number_a, state, number_b = expressions[index-1..index+1]
        expressions[index] = operate(number_a, number_b, state)
        expressions[index-1] = nil
        expressions[index+1] = nil
        expressions = expressions.compact

      elsif expressions.any? { |exp| exp == "+" || exp == "-" }
        index = expressions.index { |i| i == "+" || i == "-" }
        number_a, state, number_b = expressions[index-1..index+1]
        expressions[index] = operate(number_a, number_b, state)
        expressions[index-1] = nil
        expressions[index+1] = nil
        expressions = expressions.compact
      else
        result = expressions.inject(:+)
        expressions =[]
      end
    end

    result
  end

  def evaluate(expression)
    calculate(LexicalAnalyzer.tokenize(expression).map { |exp| exp.value })
  end
end

tests = [
  ['2 / 2 + 3 * 4 - 6', 7],
  ["127", 127],
  ['2 + 3', 5]
]

tests.each do |(equation, result)|
  puts "Entering: #{equation}"
  puts "Expecting: #{result}"
  calculation = Calculator.new.evaluate(equation)
  puts "Output: " << calculation.inspect
  puts calculation == result ? "SUCCESS" : "FAILED"
  puts "---"
end
