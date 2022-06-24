def tricky_method_two(a_string_param, an_array_param)
  a_string_param << 'rutabaga'
  an_array_param = ['pumpkins', 'rutabaga']
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method_two(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"

=begin
"My string looks like this now: pumpkinsrutabaga
"My array looks like this now: ["pumpkins"]"

This is the opposite of the last question. The << operation is now
being performed on the string argument, mutating the original string.

The array is now just being reassigned to the an_array_param local variable.
=end