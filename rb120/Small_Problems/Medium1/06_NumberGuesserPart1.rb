class GuessingGame
  ENTER_NUM = "Enter a number between 1 and 100:"

  attr_accessor :guesses, :number
  attr_reader :target

  def initialize
    @guesses = 7
    @target = rand(101)
    @number = nil
  end

  def play
    loop do
      display_guesses_remaining
      prompt_number
      check_number
      self.guesses -= 1
      break if game_over?
    end
    display_result
  end

  def display_guesses_remaining
    puts "You have #{guesses} guesses remaining."
  end

  def prompt_number
    puts ENTER_NUM
    loop do
      self.number = gets.to_i
      break if (0..100).include?(number)
      puts 'Invalid guess. ' + ENTER_NUM
    end
  end

  def check_number
    if number < target
      puts "Your guess is too low."
    elsif number > target
      puts "Your guess is too high."
    else
      puts "That's the number!"
    end
  end

  def game_over?
    guesses == 0 || number == target
  end

  def display_result
    puts guesses == 0 ? 'You have no more guesses. You lost!' : 'You won!'
  end
end

game = GuessingGame.new
game.play