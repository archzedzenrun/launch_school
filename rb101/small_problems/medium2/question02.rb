=begin
Input: String
Output: Boolean

Requirements:
-Limits the words you can spell with the blocks to just those words that
do not use both letters from any given block. Each letter in each block can only be used once.
-Write a method that returns true if the word pass in as an argument
can be spelled from this set of blocks, false otherwise.

B:O   X:K   D:Q   C:P   N:A
G:T   R:E   F:S   J:W   H:U
V:I   L:Y   Z:M

Examples:
block_word?('BATCH') == true
block_word?('BUTCH') == false  # returns false because U and H are in the same block.
block_word?('jest') == true

Algorithm:
-Initialize a blocks variable set to a nested array of all block pairs.
-Iterate through the blocks
-Check if both elements in the current block are included in the input string(uppercased)
-If they are, return false
-Else return true
=end

def block_word?(string)
  blocks = [['B','O'], ['X','K'], ['D','Q'], ['C','P'], ['N','A'], ['G','T'],
            ['R','E'], ['F','S'], ['J','W'], ['H','U'], ['V','I'], ['L','Y'],
            ['Z','M']]

  blocks.each do |block|
    return false if string.upcase.include?(block[0]) && string.upcase.include?(block[1])
  end

  true
end

p block_word?('BATCH') == true
p block_word?('BUTCH') == false
p block_word?('jest')  == true