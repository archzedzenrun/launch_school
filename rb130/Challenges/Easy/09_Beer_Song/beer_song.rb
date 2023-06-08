=begin
*PROBLEM*
Explicit Rules:
-Generate the lyrics of the 99 bottles of beer song.

Implicit Rules:
BeerSong class
verse class method
 -takes 1 argument(integer)
 -input will be an integer 0 or greater

*ALGORITHM*
verse class method
-Input integer
-Interpolate the input into the beer song verse

lyrics class method
-init a counter to 0
-until counter is > 99
  -pass counter to verse class method
=end

class BeerSong
  def self.verse(num)
    case num
    when 2 then two_bottles
    when 1 then one_bottle
    when 0 then no_bottle
    else        other_bottle(num)
    end
  end

  def self.two_bottles
    "2 bottles of beer on the wall, 2 bottles of beer.\n" \
    "Take one down and pass it around, 1 bottle of beer on the wall.\n"
  end

  def self.one_bottle
    "1 bottle of beer on the wall, 1 bottle of beer.\n" \
    "Take it down and pass it around, no more bottles of beer on the wall.\n"
  end

  def self.no_bottle
    "No more bottles of beer on the wall, no more bottles of beer.\n" \
    "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
  end

  def self.other_bottle(num)
    "#{num} bottles of beer on the wall, #{num} bottles of beer.\n" \
    "Take one down and pass it around, #{num - 1} bottles of beer on the wall.\n"
  end

  def self.verses(start_num, end_num)
    song = []
    until start_num < end_num
      song << verse(start_num)
      start_num -= 1
    end
    song.join("\n")
  end

  def self.lyrics
    verses(99, 0)
  end
end
