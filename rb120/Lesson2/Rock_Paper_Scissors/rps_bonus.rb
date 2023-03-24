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

  def small_pause
    sleep(1)
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

  attr_accessor :move, :name, :score, :move_history, :win_history

  @@human_current_move = ''

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
    your_name = ' '
    loop do
      prompt('name?')
      your_name = gets.chomp
      break unless your_name.strip == ''
      clear_screen
      prompt('empty?')
    end
    self.name = your_name.strip
  end

  def enter_choice
    choice = nil
    loop do
      prompt('choice')
      choice = gets.chomp
      break if Move::MOVES_HASH.keys.include?(choice.downcase)
      prompt('invalid')
    end
    choice
  end

  def choose
    choice = enter_choice.downcase
    self.move = Move.new(choice)
    @@human_current_move = choice
    store_move(move)
    clear_screen
  end
end

class Bot < Player
  def set_name
    self.name = self.class.name
  end
end

class Bishop < Bot # Standard opponent.
  def choose
    self.move = Move::MOVES_HASH.keys.sample
    store_move(move)
  end
end

class Chappie < Bot # Mimics the players move.
  def choose
    self.move = @@human_current_move
    store_move(move)
  end
end

class Optimus < Bot # Has a head start but always picks rock.
  def initialize
    super
    @score = 3
  end

  def choose
    self.move = 'rock'
    store_move(move)
  end
end

class Chucky < Bot # Sometimes adds 1 to his score, likely to pick scissors.
  def choose
    cheat_score
    choices = ['paper', 'paper', 'spock', 'spock']
    12.times { choices << 'scissors' }
    self.move = choices.sample
    store_move(move)
  end

  def cheat_score
    num = rand(10)
    self.score += 1 if (0..4).include?(num)
  end
end

class Vision < Bot # Unbeatable
  def choose
    potential_moves = []
    Move::MOVES_HASH.each do |move, value_arr|
      potential_moves << move if value_arr.include?(@@human_current_move)
    end
    self.move = potential_moves.sample
    store_move(move)
  end
end

class RPSGame
  include Formatable

  MAX_SCORE = 5

  attr_accessor :human, :bot

  def initialize
    @human = Human.new
  end

  def choose_opponent
    choice = ''
    loop do
      prompt('choose_opponent')
      choice = gets.chomp
      break if ['', '1', '2', '3', '4', '5'].include?(choice)
      clear_screen
      prompt('invalid')
    end
    assign_opponent(choice)
    choice == '' ? introduce_random_choice : introduce_selected_choice
  end

  def assign_opponent(choice)
    bots = [Bishop.new, Chappie.new, Chucky.new, Optimus.new, Vision.new]
    case choice
    when '1' then @bot = bots[0]
    when '2' then @bot = bots[1]
    when '3' then @bot = bots[2]
    when '4' then @bot = bots[3]
    when '5' then @bot = bots[4]
    when ''  then @bot = bots.sample
    end
  end

  def introduce_selected_choice
    clear_screen
    puts "You selected #{bot.name}!"
    pause
  end

  def introduce_random_choice
    clear_screen
    puts "Your opponent will be..."
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
    display_winner
  end

  def display_winner
    if human.move > bot.move
      human_won
    elsif human.move < bot.move
      bot_won
    else
      tie
    end
    pause
    clear_screen
  end

  def human_won
    human.score += 1
    store_wins
    small_pause
    puts "#{human.name} won!"
  end

  def bot_won
    bot.score += 1
    store_wins
    small_pause
    puts "#{bot.name} won!"
  end

  def tie
    human.score += 1
    bot.score += 1
    store_wins
    small_pause
    prompt('tie')
  end

  def store_wins
    human.store_win(human.score)
    bot.store_win(bot.score)
  end

  def display_score
    puts "Current score:"
    puts "#{human.name} - #{human.score}"
    puts "#{bot.name} - #{bot.score}"
    pause
  end

  def max_score_reached?
    human.score >= MAX_SCORE || bot.score >= MAX_SCORE
  end

  def results
    puts "Tournament results:"
    if human.score >= MAX_SCORE && bot.score >= MAX_SCORE
      prompt('tie')
    elsif human.score >= MAX_SCORE
      puts "#{human.name} is the winner!"
    elsif bot.score >= MAX_SCORE
      puts "#{bot.name} is the winner!"
    end
  end

  def reset_score
    human.score = 0
    bot.score = 0
    human.move_history = []
    human.win_history = []
    bot.move_history = []
    bot.win_history = []
  end

  def move_history?
    answer = ''
    loop do
      new_line
      prompt('move_history?')
      answer = gets.chomp
      break if ['y', 'n'].include?(answer.downcase)
      prompt('invalid')
    end
    answer.downcase == 'y'
  end

  def display_move_history
    clear_screen
    info = move_history_info
    info[1].each_with_index do |move, idx|
      score = "Score: #{info[2][idx]} - #{info[5][idx]}"
      moves = "#{info[0]}: #{move}, #{info[3]}: #{info[4][idx]}, "
      puts "Turn #{idx + 1} => " + moves + score
    end
    new_line
  end

  def move_history_info
    [human.name, human.move_history, human.win_history,
     bot.name, bot.move_history, bot.win_history]
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

  def display_goodbye_message
    clear_screen
    prompt('goodbye')
  end

  def play
    loop do
      clear_screen
      human.choose
      bot.choose
      display_moves
      display_score
      break if max_score_reached?
    end
    clear_screen
  end

  def game
    display_welcome_message
    loop do
      choose_opponent
      play
      results
      display_move_history if move_history?
      break unless play_again?
    end
    display_goodbye_message
  end
end

RPSGame.new.game
