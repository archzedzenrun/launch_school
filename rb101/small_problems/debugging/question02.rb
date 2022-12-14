def shout_out_to(name)
  #name.chars.each { |c| c.upcase! } # chars creates an array of new string objects. upcase is being called on them, not the string referenced by name.
  name.upcase!
  puts 'HEY ' + name
end

shout_out_to('you') # expected: 'HEY YOU'