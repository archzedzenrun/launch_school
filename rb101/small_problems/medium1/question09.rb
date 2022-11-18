=begin
Requirements:
-Rewrite the recursive fibonacci method so that it computes its results without recursion
=end


def fibonacci(n)
  fib = [1, 1]

  until fib.size >= n
    fib << (fib[-1] + fib[-2])
  end

  fib.last
end

p fibonacci(20) == 6765
p fibonacci(100) == 354224848179261915075
p fibonacci(100_001) # => 4202692702.....8285979669707537501

# Alternate

def fibonacci(n)
  fib = [1, 1]

  (n - 2).times do |num|
    fib.push(fib.last(2).sum).shift
  end

  fib.last
end
