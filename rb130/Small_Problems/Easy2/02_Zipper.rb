=begin
*ALGORITHM*
-Create a results array
-Iterate over first array arg
  -Create a temp array
  -Add ele at current index to temp array
  -Add ele at current index in second array arg to temp array
  -Push temp array to results array
-Return results array
=end

def zip(arr1, arr2)
  arr1.each_index.with_object([]) do |idx, results|
    results << [arr1[idx], arr2[idx]]
  end
end

def zip(arr1, arr2)
  arr1.map.with_index { |num, idx| [num, arr2[idx]] }
end

p zip([1, 2, 3], [4, 5, 6]) == [[1, 4], [2, 5], [3, 6]]