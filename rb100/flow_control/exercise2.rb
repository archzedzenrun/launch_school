def method(string)
   if string.length > 10
      string.upcase
   else
      string
   end 
end 

puts method("This is a test")
puts method("Test")