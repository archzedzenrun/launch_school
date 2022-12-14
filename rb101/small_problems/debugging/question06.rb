def move(n, from_array, to_array)
  return if n == 0 # break statement added
  to_array << from_array.shift

  move(n - 1, from_array, to_array)
end

# Example

todo = ['study', 'walk the dog', 'coffee with Tom']
done = ['apply sunscreen', 'go to the beach']

move(2, todo, done)

p todo # should be: ['coffee with Tom']
p done # should be: ['apply sunscreen', 'go to the beach', 'study', 'walk the dog']

# Further exploration
# Invoking shift on an empty array returns nil, so if the size of from_array is less than
# n, nil's will be appended to the to_array.