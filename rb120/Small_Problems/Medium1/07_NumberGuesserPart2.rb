class GuessingGame
  attr_accessor :guesses, :number
  attr_reader :target_range, :target

  def initialize(min, max)
    @target_range = (min..max)
    @target = target_range.to_a.sample
    @guesses = Math.log2(size_of_range).to_i + 1
    @number = nil
  end

  def size_of_range
    target_range.max - target_range.min
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
    display_enter_num
    loop do
      self.number = gets.to_i
      break if target_range.include?(number)
      puts 'Invalid guess. ' + display_enter_num
    end
  end

  def display_enter_num
    puts "Enter a number between #{target_range.min} and #{target_range.max}:"
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
    puts number == target ? 'You won!' : 'You have no more guesses. You lost!'
  end
end

game = GuessingGame.new(501, 2500)
game.play
