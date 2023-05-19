def missing(arr)
  (arr.first..arr.last).each_with_object([]) do |num, new_arr|
    new_arr << num if !arr.include?(num)
  end
end

def missing(arr)
  (arr.first..arr.last).to_a - arr
end

p missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
p missing([1, 2, 3, 4]) == []
p missing([1, 5]) == [2, 3, 4]
p missing([6]) == []