=begin
# PROBLEM
  Input: Array
  Output: Integer
  Explicit requirements:
  - Write a method that counts the number of occurrences of each element
    in a given array.
  - The words in the array are case sensitive.
  - Once counted, print each element alongside the number of occurrences.
  Implicit requirements:
  Questions:

# EXAMPLES
  car => 4
  truck => 3
  SUV => 1
  motorcycle => 2
# DATA STRUCTURE
  - Hash
# ALGORITHM
  - Given an array,
  - Iterate over each element in the array
  - Add the count of each element to the hash
  - Iterate over each element of the hash and print the keys and values
# CODE
=end

def count_occurrences(array)
  hash = {}
  array.uniq.each { |element| hash[element] = array.count(element) }
  hash.each { |key, value| puts "#{key} => #{value}" }
end


vehicles = ['car', 'car', 'truck', 'car', 'SUV', 'truck',
            'motorcycle', 'motorcycle', 'car', 'truck']

count_occurrences(vehicles)

#Revisit

def count_occurrences(array)
  array.uniq.each { |car| puts "#{car} => #{array.count(car)}" }
end