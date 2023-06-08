=begin
*PROBLEM*
Explicit Rules:
-Compute the scrabble score for a given word.
-Add up the values of each character in the word.

Letter values:
A, E, I, O, U, L, N, R, S, T 	 1
D, G 	                         2
B, C, M, P 	                   3
F, H, V, W, Y 	               4
K 	                           5
J, X 	                         8
Q, Z 	                         10

Implicit Rules:
-Letters are case-insensitive (upper and lower the same)
-empty words/whitespace/nil scores 0

Scrabble class
-Constructor method takes 1 argument
-Save argument as a word to be referenced later

score instance method
-Returns the score of saved word

score class method
-Returns the score of passed in word

*DATA STRUCTURE*
Hash - Letter values
Array - Iteration

*ALGORITHM*
score method
-Iterate through the characters of the saved word
  -Transform char into its value in the letter hash.
-Return the sum of all values

score class method
-Pass the input argument to a new instance of the Scrabble class
-Invoke the score method
=end

class Scrabble
  VALUES = { 1 => 'AEIOULNRST', 2 => 'DG', 3 => 'BCMP', 4 => 'FHVWY',
             5 => 'K', 8 => 'JX', 10 => 'QZ' }

  def initialize(word)
    @word = word
  end

  def self.score(word)
    Scrabble.new(word).score
  end

  def score
    return 0 if @word.nil? || @word.strip.empty?
    @word.chars.map { |char| calc_value(char.upcase) }.sum
  end

  private

  def calc_value(char)
    VALUES.each do |value, letters|
      return value if letters.include?(char)
    end
  end
end
