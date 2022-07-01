['ant', 'bat', 'caterpillar'].count do |str|
  str.length < 4
end

# .count counts the number of elements in the block that return true.
# In this case the return value will be 2.