require "./easy_tests.rb"

class BinarySearch
  attr_reader :list

  def initialize(list)
    @list = list
  end

  def search_for(key)
    return middle if list[middle] == key

    if list[middle] > key
      return BinarySearch.new(list[0..middle]).search_for(key)
    else
      return BinarySearch.new(list[middle..-1]).search_for(key) + middle
    end
  end

  def middle
    list.length / 2
  end
end

easy_tests = EasyTests.new
easy_tests.assert_equal 4, BinarySearch.new([1, 2, 3, 4, 5, 6, 7, 8, 9]).search_for(5)
easy_tests.assert_equal 7, BinarySearch.new([1, 2, 3, 4, 5, 6, 7, 8, 9]).search_for(8)
easy_tests.run
