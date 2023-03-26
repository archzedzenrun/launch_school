require 'yaml'
MESSAGES = YAML.load_file('messages.yaml')

MAX_SCORE = 5

module Formatable
  def new_line
    puts "\n"
  end

  def clear_screen
    system("clear")
  end

  def pause
    sleep(3)
  end

  def small_pause
    sleep(1)
  end
end

module Promptable
  def prompt(message)
    puts MESSAGES[message]
  end

  def prompt_invalid_input
    clear_screen
    prompt('invalid')
    new_line
    small_pause
  end

  def prompt_player_name
    your_name = ' '
    loop do
      prompt('name?')
      your_name = gets.chomp
      break unless your_name.strip == '' || your_name.size > 10
      clear_screen
      prompt('empty?')
      small_pause
    end
    self.name = your_name.strip
  end

  def prompt_player_choice
    valid_moves = Move::MOVES_HASH.keys
    choice = ''
    loop do
      prompt('choice')
      choice = gets.chomp
      break if ['', '1', '2', '3', '4', '5'].include?(choice)
      prompt_invalid_input
    end
    choice == '' ? valid_moves.sample : valid_moves[choice.to_i - 1]
  end

  def prompt_choose_opponent
    clear_screen
    choice = ''
    loop do
      prompt('choose_opponent')
      choice = gets.chomp
      break if ['', '1', '2', '3', '4', '5', '6'].include?(choice)
      prompt_invalid_input
    end
    assign_opponent(choice)
    choice == '' ? display_random_opponent : display_selected_opponent
  end

  def prompt_move_history?
    answer = ''
    loop do
      prompt('move_history?')
      answer = gets.chomp
      break if ['y', 'n'].include?(answer.downcase)
      prompt_invalid_input
    end
    answer.downcase == 'y'
  end

  def prompt_play_again?
    answer = nil
    loop do
      prompt('play_again?')
      answer = gets.chomp
      break if ['y', 'n'].include?(answer.downcase)
      prompt_invalid_input
    end
    return false if answer.downcase == 'n'
    reset_score if answer.downcase == 'y'
  end
end

module Displayable
  def display_selected_opponent
    clear_screen
    puts "You selected #{bot.name}!"
    pause
  end

  def display_random_opponent
    clear_screen
    puts "Your random opponent will be..."
    small_pause
    puts "#{bot.name}!"
    pause
  end

  def display_welcome_message
    clear_screen
    prompt('game_rules')
    gets
    clear_screen
  end

  def display_moves
    puts "#{human.name} chose: #{human.move}"
    puts "#{bot.name} chose: #{bot.move}"
  end

  def display_human_won
    small_pause
    puts "#{human.name} won!"
  end

  def display_bot_won
    small_pause
    puts "#{bot.name} won!"
  end

  def display_tie
    small_pause
    prompt('tie')
  end

  def display_score
    puts "Current score:"
    puts "#{human.name} - #{human.score}"
    puts "#{bot.name} - #{bot.score}"
    pause
  end

  def display_results
    puts "Game results:"
    if human.score >= MAX_SCORE && bot.score >= MAX_SCORE
      prompt('tie')
    elsif human.score >= MAX_SCORE
      puts "#{human.name} is the winner!"
    elsif bot.score >= MAX_SCORE
      puts "#{bot.name} is the winner!"
    end
    new_line
  end

  def display_move_history
    clear_screen
    info = move_history_info
    info[1].each_with_index do |move, idx|
      moves = "#{info[0]}: #{move}, #{info[3]}: #{info[4][idx]}, "
      score = "Score: #{info[2][idx]} - #{info[5][idx]}"
      puts "Turn #{idx + 1} => " + moves + score
    end
    new_line
  end

  def display_goodbye_message
    clear_screen
    prompt('goodbye')
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

  def >(bot_value)
    MOVES_HASH[player_value].include?(bot_value)
  end

  def <(bot_value)
    MOVES_HASH[bot_value].include?(player_value)
  end

  def to_s
    player_value
  end
end

class Player
  include Formatable
  include Promptable

  attr_accessor :move, :name, :score, :move_history, :win_history

  @@human_current_move = ''

  def initialize
    set_name
    @score = 0
    @move_history = []
    @win_history = []
  end

  def store_move!(move)
    move_history << move
  end

  def store_win!(win)
    win_history << win
  end

  def increment_score!
    self.score += 1
  end
end

class Human < Player
  def set_name
    prompt_player_name
  end

  def choose_move
    choice = prompt_player_choice
    self.move = Move.new(choice)
    @@human_current_move = choice
    store_move!(move)
    clear_screen
  end
end

class Bot < Player
  def set_name
    self.name = self.class.name
  end
end

class Bishop < Bot # Standard opponent.
  def choose_move
    self.move = Move::MOVES_HASH.keys.sample
    store_move!(move)
  end
end

class C3PO < Bot # Always loses
  def choose_move
    self.move = Move::MOVES_HASH[@@human_current_move].sample
    store_move!(move)
  end
end

class Chappie < Bot # Mimics the players move.
  def choose_move
    self.move = @@human_current_move
    store_move!(move)
  end
end

class Optimus < Bot # Has a head start, usually picks rock.
  def initialize
    super
    @score = 3
  end

  def choose_move
    choices = ['paper', 'scissors', 'lizard', 'spock']
    12.times { choices << 'rock' }
    self.move = choices.sample
    store_move!(move)
  end
end

class Chucky < Bot # Sometimes adds 1 to his score, likely to pick scissors.
  def choose_move
    cheat_score!
    choices = ['paper', 'paper', 'spock', 'spock']
    12.times { choices << 'scissors' }
    self.move = choices.sample
    store_move!(move)
  end

  private

  def cheat_score!
    num = rand(10)
    increment_score! if (0..3).include?(num)
  end
end

class Vision < Bot # Always wins
  def choose_move
    potential_moves = []
    Move::MOVES_HASH.each do |move, value_arr|
      potential_moves << move if value_arr.include?(@@human_current_move)
    end
    self.move = potential_moves.sample
    store_move!(move)
  end
end

class RPSGame
  include Formatable
  include Promptable
  include Displayable

  attr_accessor :human, :bot

  def initialize
    @human = Human.new
  end

  def game
    display_welcome_message
    loop do
      prompt_choose_opponent
      play
      display_results
      display_move_history if prompt_move_history?
      break unless prompt_play_again?
    end
    display_goodbye_message
  end

  private

  def play
    loop do
      clear_screen
      human.choose_move
      bot.choose_move
      display_moves
      calculate_winner
      display_score
      break if max_score_reached?
    end
    clear_screen
  end

  def assign_opponent(choice)
    bots = [Bishop.new, C3PO.new, Chappie.new,
            Chucky.new, Optimus.new, Vision.new]
    @bot = choice.empty? ? bots.sample : bots[choice.to_i - 1]
  end

  def calculate_winner
    if human.move > bot.move
      human_won!
    elsif human.move < bot.move
      bot_won!
    else
      tie_game!
    end
    pause
    clear_screen
  end

  def human_won!
    human.increment_score!
    store_win!
    display_human_won
  end

  def bot_won!
    bot.increment_score!
    store_win!
    display_bot_won
  end

  def tie_game!
    human.increment_score!
    bot.increment_score!
    store_win!
    display_tie
  end

  def store_win!
    human.store_win!(human.score)
    bot.store_win!(bot.score)
  end

  def max_score_reached?
    human.score >= MAX_SCORE || bot.score >= MAX_SCORE
  end

  def reset_score
    human.score = 0
    bot.score = 0
    human.move_history = []
    human.win_history = []
    bot.move_history = []
    bot.win_history = []
  end

  def move_history_info
    [human.name, human.move_history, human.win_history,
     bot.name, bot.move_history, bot.win_history]
  end
end

RPSGame.new.game
