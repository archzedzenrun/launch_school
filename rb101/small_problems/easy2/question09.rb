=begin 

name = 'Bob'
save_name = name
name.upcase!
puts name, save_name

This will print:
BOB
BOB

The name variable is assigned to the string 'Bob'. The save_name variable
is assigned to the name variable, so it is also referencing the string 'Bob'. 
Calling the .upcase! method mutates the caller, in this case the name variable,
and changes the string to 'BOB'. Since the save_name variable is pointing to the
same string, its value will be affected and will also print 'BOB'.

=end