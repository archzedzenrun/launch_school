def print_in_box(string)
  line = "++"
  space = "||"
  (string.size + 2).times { line.insert(1, '-') }
  (string.size + 2).times { space.insert(1, ' ') }
  puts line
  puts space
  puts "| #{string} |"
  puts space
  puts line
end

print_in_box('To boldly go where no one has gone before.')

# Revisit

def print_box(string)
  puts "+-#{"-" * string.size}-+"
  puts "| #{" " * string.size} |"
  puts "| #{string} |"
  puts "| #{" " * string.size} |"
  puts "+-#{"-" * string.size}-+"
end