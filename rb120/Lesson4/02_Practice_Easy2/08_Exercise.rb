class Game
  def play
    "Start the game!"
  end
end

class Bingo < Game # Bingo now has access to methods in the Game class through inheritance.
  def rules_of_play
    #rules of play
  end
end

puts Bingo.new.play