=begin
Input: Arrah, Hash
Output: String

Requirements:
-Create a method that takes 2 arguments, an array and a hash
-The array will contain 2 or more elements that, when combined with adjoining spaces,
will produce a persons name.
-The hash will contain two keys, :title and :occupation, and the appropriate values.
-Return a greeting that uses the person full name, and mentions the persons title and occupation

Algorithm:
-Output a string containing the following information:
-The first element of the input array referencing the persons first name
-The second element of the input array referencing the persons middle name
-The third element of the input array referencing the persons last name
-The value of the title: key in the hash
-The value of the occupation: key in the hash
=end

# def greetings(arr, hash)
#   puts "Hello, #{arr[0]} #{arr[1]} #{arr[2]}! Nice to have a #{hash[:title]} #{hash[:occupation]} around."
# end

# Further exploration

def greetings(arr, hash)
  name = arr.join(' ')
  title = hash[:title]
  occupation = hash[:occupation]
  puts "Hello, #{name}! Nice to have a #{title} #{occupation} around."
end

greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })
