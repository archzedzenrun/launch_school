=begin

array1 = %w(Moe Larry Curly Shemp Harpo Chico Groucho Zeppo)
array2 = []
array1.each { |value| array2 << value }
array1.each { |value| value.upcase! if value.start_with?('C', 'S') }
puts array2

This will print:
Moe
Larry
CURLY
SHEMP
Harpo
CHICO
Groucho
Zeppo

The values in array2 are references to the values in array1, so destructively
modifying values in array1 with the .upcase! method will also affect the values
being referenced in array2

This feature of ruby can get you into trouble because you may unintentionally 
modify certain parts of your code that you didnt want modified. This could have 
been avoided in this problem by not using the destructive version of the .upcase
method, or by pushing duplicated values into array2. array1.each { |value| array2 << value.dup }.

=end