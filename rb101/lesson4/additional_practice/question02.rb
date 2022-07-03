ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

# Using a loop

counter = 0
total_ages = 0

loop do 
  break if counter == ages.size
  current_value = ages.values[counter]
  total_ages += current_value
  counter += 1
end 

puts total_ages

# Iteration with .each method

total_ages2 = 0
ages.each { |name, age| total_ages2 += age }

puts total_ages2