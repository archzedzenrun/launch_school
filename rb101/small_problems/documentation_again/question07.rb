s = 'abc'
puts s.public_methods.inspect
# Returns the list of protected methods accessible to obj.

puts s.public_methods(all=false).inspect
# If the all parameter is set to false, only those methods in the receiver will be listed.