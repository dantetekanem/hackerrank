def insertionSort(arr)
  last = arr.pop
  num = arr.size - 1
  until num < 0 do
    index = num
    n = arr[index]
    if n > last
      arr[index+1] = n
      puts arr.join(' ')
    else
      arr[index+1] = last
      puts arr.join(' ')
      break
    end

    if index == 0
      arr[index] = last
      puts arr.join(' ')
    end
    #
    num -= 1
  end
end

count = 1 # gets.to_i
# arr = gets.strip.split.map { |i| i.to_i }
arr = "2 3 4 5 6 7 8 9 10 1".split.map { |i| i.to_i }

insertionSort(arr)
