puts "Enter a number between 0 and 100"
number = gets.chomp.to_i
if number < 0
   puts "You cant enter a negative number"
elsif number <= 50
   puts "The number is between 0 and 50"
elsif number <= 100
   puts "The number is between 51 and 100"
else 
   puts "You cant enter a number above 100"
end 