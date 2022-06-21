# Yes, hash values can be arrays.
hash = { ages: [32, 34, 25] } 
p hash[:ages]

# Yes, you can have an array of hashes.
array = [{name: "george"}, {age: 65}]
p array[0]