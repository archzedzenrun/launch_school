=begin
The problem here is that fib method is trying to access a variable that is 
defined outside of its scope.  One way this can be solved is by moving the 
limit variable inside of the method definition.
=end 

def fib(first_num, second_num)
  limit = 15
  while first_num + second_num < limit
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
  end
  sum
end

result = fib(0, 1)
puts "result is #{result}"
