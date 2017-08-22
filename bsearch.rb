require "benchmark"

data = 1000000.times.map { |i| "leo_#{i}" }
find = "leo_6782"

Benchmark.bm do |x|
  x.report "bsearch".center(30) do
    data.bsearch { |x| x == find }
  end

  x.report "index".center(30) do
    data.index(find)
  end
end
