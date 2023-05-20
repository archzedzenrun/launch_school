=begin
*PROBLEM*
Input: 3 integers, block
Output: Return value of block

*ALGORITHM*
-Yield start value to the block each iteration
-Add the step value to the start value until start value is greater than
ending value
=end

def step(start_val, end_val, step_val)
  loop do
    yield(start_val)
    break if (start_val + step_val) > end_val
    start_val += step_val
  end
end

p step(1, 14, 3) { |value| puts "value = #{value}" }