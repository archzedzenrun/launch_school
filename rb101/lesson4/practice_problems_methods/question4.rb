['ant', 'bear', 'cat'].each_with_object({}) do |value, hash|
  hash[value[0]] = value
end

# { "a" => "ant", "b" => "bear", "c" => "cat" } is returned.  
# We pass in a hash object as an argument to the each_with_object method
# which is then passed to the block and its value is updated and returned 
# at the end of each iteration.