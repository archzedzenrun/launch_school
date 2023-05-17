def each(arr)
  counter = 0
  until counter == arr.size
    yield(arr[counter])
    counter += 1
  end
  arr
end

each([1, 2, 3, 4, 5]) do |num|
  puts num + 2
end
