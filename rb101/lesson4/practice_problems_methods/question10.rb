[1, 2, 3].map do |num|
  if num > 1
    puts num
  else
    num
  end
end

# This code will return [1, nil, nil]
# Because of the if statement, if the element is greater than 1, the last
# statement being evaluated in the block is puts num, which returns nil.
# If the element is less than 1, the last statement being evaluated is just num.