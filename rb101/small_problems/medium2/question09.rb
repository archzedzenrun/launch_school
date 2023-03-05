=begin
*PROBLEM*
Input: Array
Output: Sorted array

Rules:
-Sort the array in-place (mutate the argument)
-Assume the array contains at least 2 elements

*ALGORITHM*
-Until no swaps happen during iteration:
  -Iterate through the input array with indexes
  -Compare current element with element at next index
  -If current element is greater, swap the 2 elements
-Return sorted array
=end

def bubble_sort!(arr)
  loop do
    toggle = true
    arr.each_index do |idx|
      next if idx == arr.size - 1
      ele1 = arr[idx]
      ele2 = arr[idx + 1]

      if ele1 > ele2
        arr[idx], arr[idx + 1] = arr[idx + 1], arr[idx]
        toggle = false
      end
   end
   break if toggle
  end
  arr
end

array = [5, 3]
p bubble_sort!(array)
p array == [3, 5]

array = [6, 2, 7, 1, 4]
p bubble_sort!(array)
p array == [1, 2, 4, 6, 7]

array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
p bubble_sort!(array)
p array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)