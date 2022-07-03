ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

# Using the .delete_if method

p ages.delete_if { |name, age| age > 100 }

# Using .select method

p ages.select { |name, age| age < 100 }
