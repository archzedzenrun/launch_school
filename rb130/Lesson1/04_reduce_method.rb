def reduce(arr, default=0)
  accumulator = default
  counter = 0
  until counter == arr.size
    accumulator = yield(accumulator, arr[counter]) # acc =
    counter += 1
  end
  p accumulator
end

array = [1, 2, 3, 4, 5]

reduce(array) { |acc, num| acc + num }                    # => 15
reduce(array, 10) { |acc, num| acc + num }                # => 25
#reduce(array) { |acc, num| acc + num if num.odd? }        # => NoMethodError: undefined method `+' for nil:NilClass