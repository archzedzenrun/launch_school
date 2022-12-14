password = nil

def set_password
  puts 'What would you like your password to be?'
  new_password = gets.chomp
  new_password
  # password = new_password - unneccesary reasignment
end

def verify_password(password) # Added a method parameter named password
  puts '** Login **'
  print 'Password: '
  input = gets.chomp

  if input == password # Now evaluates as true if input is equal to the local variable password.
    puts 'Welcome to the inside!'
  else
    puts 'Authentication failed.'
  end
end

if !password
  password = set_password # If password has a falsey value (nil) assign password to the return of invoking the set_password method.
end

verify_password(password) # Pass the local variable password into the verify_password method as an argument.