class EasyTests
  attr_reader :tests, :passed, :failed

  class TestEqual
    attr_reader :expected, :action

    def initialize(expected, action)
      @expected, @action = expected, action
    end

    def run
      expected == action
    end
  end

  def initialize
    @tests = []
  end

  def assert_equal(expected, action)
    @tests << TestEqual.new(expected, action)
  end

  def run
    @passed = []
    @failed = []

    @tests.each do |test|
      if test.run
        @passed << test
      else
        @failed << test
      end
    end

    report
  end

  private

  def report
    puts "--- EasyTests by Leonardo Pereira (github.com/dantetekanem) ---"
    puts ""
    puts "#{passed.length} passed, #{failed.length} failed of #{tests.length} tests."

    if failed.length > 0
      puts ""
      failed.each do |test|
        puts "expected #{test.expected} but got #{test.action}"
      end
    end
  end
end
