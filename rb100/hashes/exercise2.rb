# merge doesnt mutate the original hash
# merge! will mutate the original hash

hash1 = { name: "bob" } 
hash2 = { age: 34 } 

puts hash1.merge(hash2)
puts hash1
puts hash2
puts hash1.merge!(hash2)
puts hash1
puts hash2