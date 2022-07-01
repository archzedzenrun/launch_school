{ a: 'ant', b: 'bear' }.map do |key, value|
  if value.size > 3
    value
  end
end

# This code will return [nil, 'bear']
# When none of the conditions in an if statement evaluate as true, the if 
# statement itself returns nil.
# The value 'ant' didnt evaluate as true in the if statement so it returned nil.