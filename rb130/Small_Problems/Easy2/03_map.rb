def map(arr)
  if block_given?
    arr.each_with_object([]) { |val, new_arr| new_arr << yield(val) }
  else
    arr.to_enum
  end
end

p map([1, 3, 6]) { |value| value**2 } == [1, 9, 36]
p map([]) { |value| true } == []
p map(['a', 'b', 'c', 'd']) { |value| false } == [false, false, false, false]
p map(['a', 'b', 'c', 'd']) { |value| value.upcase } == ['A', 'B', 'C', 'D']
p map([1, 3, 4]) { |value| (1..value).to_a } == [[1], [1, 2, 3], [1, 2, 3, 4]]
p map({'a' => 1, 'b' => 2})# { |k, v| v + 1 }