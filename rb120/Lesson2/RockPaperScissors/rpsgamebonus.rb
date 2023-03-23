require 'yaml'
MESSAGES = YAML.load_file('messages.yaml')

module Formatable
  def prompt(message)
    puts MESSAGES[message]
  end

  def new_line
    puts "\n"
  end

  def clear_screen
    system("clear")
  end

  def pause
    sleep(3)
  end
end

class Move
  MOVES_HASH = { 'rock' => ['scissors', 'lizard'],
                 'paper' => ['rock', 'spock'],
                 'scissors' => ['paper', 'lizard'],
                 'lizard' => ['spock', 'paper'],
                 'spock' => ['scissors', 'rock'] }

  attr_reader :player_value

  def initialize(value)
    @player_value = value
  end

  def >(computer_value)
    MOVES_HASH[player_value].include?(computer_value)
  end

  def <(computer_value)
    MOVES_HASH[computer_value].include?(player_value)
  end

  def to_s
    player_value
  end
end

class Player
  include Formatable

  attr_accessor :move, :name, :score, :move_history, :win_history

  def initialize
    set_name
    @score = 0
    @move_history = []
    @win_history = []
  end

  def store_move(move)
    move_history << move
  end

  def store_win(win)
    win_history << win
  end
end

class Human < Player
  def set_name
    your_name = ''
    loop do
      prompt('name?')
      your_name = gets.chomp
      break unless your_name.empty?
      prompt('empty?')
    end
    self.name = your_name
  end

  def choose
    choice = nil
    loop do
      prompt('choice')
      choice = gets.chomp
      break if Move::MOVES_HASH.keys.include?(choice.downcase)
      prompt('invalid')
    end
    self.move = Move.new(choice.downcase)
    store_move(move)
    clear_screen
  end
end

class Computer < Player
  def set_name
    self.name = ['R2D2', 'Hal'].sample
  end

  def choose

    if name == 'R2D2'
      self.move = R2D2.new.action
      store_move(move) # It works here but.....
    elsif name == 'Hal'
      self.move = Hal.new.action
      store_move(move) # It works here but.....
    end
  end

end


class R2D2 < Computer
  def action
    choice = 'rock'
    store_move(choice) # Why cant choice be stored by store_move here?
    choice
  end
end

class Hal < Computer
  def action
    choices = ['rock', 'lizard', 'spock']
    7.times { choices << 'scissors' }
    choice = choices.sample
    store_move(choice) # Why cant choice be stored by store_move here?
    choice
  end
end

class RPSGame
  include Formatable

  MAX_SCORE = 3

  attr_accessor :human, :computer

  def initialize
    @human = Human.new
    @computer = Computer.new
  end

  def display_welcome_message
    clear_screen
    prompt('game_rules')
    gets
    clear_screen
  end

  def display_goodbye_message
    clear_screen
    prompt('goodbye')
  end

  def display_moves
    puts "#{human.name} chose: #{human.move}"
    puts "#{computer.name} chose: #{computer.move}"
    display_winner
  end

  def display_winner

    if human.move > computer.move
      human_won
    elsif human.move < computer.move
      computer_won
    else
      tie
    end
    binding.pry
    pause
    clear_screen
  end

  def human_won
    human.score += 1
    human.store_win(human.score)
    computer.store_win(computer.score)
    puts "#{human.name} won!"
  end

  def computer_won
    computer.score += 1
    human.store_win(human.score)
    computer.store_win(computer.score)
    puts "#{computer.name} won!"
  end

  def tie
    human.score += 1
    computer.score += 1
    human.store_win(human.score)
    computer.store_win(computer.score)
    prompt('tie')
  end

  def display_score
    puts "Current score:"
    puts "#{human.name} - #{human.score}"
    puts "#{computer.name} - #{computer.score}"
  end

  def max_score_reached?
    human.score == MAX_SCORE || computer.score == MAX_SCORE
  end

  def results
    puts "Tournament results:"
    if human.score == MAX_SCORE && computer.score == MAX_SCORE
      prompt('tie')
    elsif human.score == MAX_SCORE
      puts "#{human.name} is the winner!"
    elsif computer.score == MAX_SCORE
      puts "#{computer.name} is the winner!"
    end
  end

  def reset_score
    human.score = 0
    computer.score = 0
    human.move_history = []
    human.win_history = []
    computer.move_history = []
    computer.win_history = []
  end

  def move_history?
    answer = ''
    loop do
      puts "Would you like to see the move history for this game? (y/n)"
      answer = gets.chomp
      break if ['y', 'n'].include?(answer.downcase)
      prompt('invalid')
    end
    answer.downcase == 'y'
  end

  def display_move_history
    clear_screen
    c_moves = computer.move_history
    human.move_history.each_with_index do |move, idx|
      score = "Score: #{human.win_history[idx]} - #{computer.win_history[idx]}"
      moves = "Turn #{idx + 1} => Human: #{move}, Computer: #{c_moves[idx]}, "
      puts moves + score
    end
    new_line
  end

  def play_again?
    answer = nil
    loop do
      prompt('play_again?')
      answer = gets.chomp
      break if ['y', 'n'].include?(answer.downcase)
      prompt('invalid')
    end
    return false if answer.downcase == 'n'
    reset_score if answer.downcase == 'y'
    clear_screen
  end

  def play
    loop do
      human.choose
      computer.choose
      display_moves
      display_score
      break if max_score_reached?
    end
    clear_screen
  end

  def game
    display_welcome_message
    loop do
      play
      results
      display_move_history if move_history?
      break unless play_again?
    end
    display_goodbye_message
  end
end

RPSGame.new.game