munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

# Using an if statement

munsters.each do |name, details|
  if details["age"] == (0..17)
    details["age_group"] = "kid"
  elsif details["age"] == (18..64)
    details["age_group"] = "adult"
  else
    details["age_group"] = "senior"
  end 
end 

# Using a case statement

munsters.each do |name, details|
  case details["age"]
  when 0..17
    details["age_group"] = "kid"
  when 18..64
    details["age_group"] = "adult"
  else
    details["age_group"] = "senior"
  end
end