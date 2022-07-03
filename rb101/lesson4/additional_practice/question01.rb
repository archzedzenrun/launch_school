flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]

# New hash using a loop

hash = {}
counter = 0 

loop do 
  break if counter == flintstones.size
  current_value = flintstones[counter]
  hash[current_value] = counter
  counter += 1
end 

p hash

# New hash using each_with_index method

hash2 = {}
flintstones.each_with_index do |name, index|
  hash2[name] = index
end 
p hash2