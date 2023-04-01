MAX_SCORE = 3
VALID_MARKERS = ('A'..'Z').to_a

module Displayable
  def clear_screen
    system('clear')
  end

  def new_line
    puts "\n"
  end

  def small_pause
    sleep(1)
  end

  def display_invalid_name
    clear_screen
    puts "Sorry, name can't be empty or more than 10 characters."
    small_pause
  end

  def display_invalid_input
    clear_screen
    puts "Invalid input!"
    small_pause
  end

  def display_welcome_message
    clear_screen
    puts "Welcome to Tic Tac Toe!"
    puts ""
    puts "First to win #{MAX_SCORE} rounds wins the game!"
    puts "Your opponent will be #{computer.name}!"
    puts ""
  end

  def display_first_to_move
    puts "Who will go first? (Turns will alternate after the first round)"
    puts "Press:"
    puts "1 for Human"
    puts "2 for Computer"
    puts "3 for Random"
  end

  def clear_screen_display_board
    clear_screen
    board.draw
  end

  def clear_screen_display_markers_board
    clear_screen
    display_markers
    board.draw
  end

  def display_markers
    puts "#{human.name}'s marker: #{human.marker}"
    puts "#{computer.name}'s marker: #{computer.marker}"
  end

  def prompt_continue
    puts "Press ENTER to continue:"
    gets
  end

  def display_current_score
    human_score = "#{human.name} - #{human.score}"
    computer_score = "#{computer.name} - #{computer.score}"
    puts "Current score: #{human_score} | #{computer_score}"
  end

  def display_game_result
    clear_screen
    if human.score == MAX_SCORE && computer.score == MAX_SCORE
      puts "Tie game!"
    elsif human.score == MAX_SCORE
      puts "#{human.name} won the game!"
    else
      puts "#{computer.name} won the game!"
    end
    new_line
  end

  def display_play_again_message
    clear_screen
    puts "Starting new game..."
    puts ""
  end

  def display_goodbye_message
    clear_screen
    puts "Thanks for playing Tic Tac Toe! Goodbye!"
  end
end

class Board
  WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                  [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
                  [[1, 5, 9], [3, 5, 7]]

  attr_reader :squares

  def initialize
    @squares = {}
    reset!
  end

  def []=(num, marker)
    @squares[num].marker = marker
  end

  def unmarked_keys
    @squares.keys.select { |key| @squares[key].unmarked? }
  end

  def full?
    unmarked_keys.empty?
  end

  def someone_won?
    winning_marker
  end

  def winning_marker
    WINNING_LINES.each do |line|
      squares = @squares.values_at(*line)
      if three_identical_markers?(squares)
        return squares.first.marker
      end
    end
    false
  end

  def reset!
    (1..9).each { |key| @squares[key] = Square.new }
  end

  # rubocop:disable Metrics/AbcSize
  # rubocop:disable Metrics/MethodLength
  def draw
    puts "1)       |2)       |3)       "
    puts "    #{@squares[1]}    |    #{@squares[2]}    |    #{@squares[3]}    "
    puts "         |         |         "
    puts "---------+---------+---------"
    puts "4)       |5)       |6)       "
    puts "    #{@squares[4]}    |    #{@squares[5]}    |    #{@squares[6]}    "
    puts "         |         |         "
    puts "---------+---------+---------"
    puts "7)       |8)       |9)       "
    puts "    #{@squares[7]}    |    #{@squares[8]}    |    #{@squares[9]}    "
    puts "         |         |         "
  end
  # rubocop:enable Metrics/AbcSize
  # rubocop:enable Metrics/MethodLength

  private

  def three_identical_markers?(squares)
    markers = squares.select(&:marked?).collect(&:marker)
    return false if markers.size != 3
    markers.uniq.size == 1
  end
end

class Square
  INITIAL_MARKER = " "

  attr_accessor :marker

  def initialize(marker=INITIAL_MARKER)
    @marker = marker
  end

  def to_s
    @marker
  end

  def marked?
    marker != INITIAL_MARKER
  end

  def unmarked?
    marker == INITIAL_MARKER
  end
end

class Player
  include Displayable

  attr_accessor :name, :score, :marker

  def initialize
    set_name
    @score = 0
  end

  def assign_marker(marker)
    self.marker = marker
  end

  def self.tie_round(human, computer)
    human.score += 1
    computer.score += 1
    puts "This round is a tie!"
  end

  def self.reset_scores!(human, computer)
    human.score = 0
    computer.score = 0
  end
end

class Human < Player
  def set_name
    self.name = prompt_name
  end

  def won_round(human)
    self.score += 1
    puts "#{human.name} won this round!"
  end

  def prompt_name
    your_name = ' '
    loop do
      puts "What is your name?"
      your_name = gets.chomp
      break unless your_name.strip == '' || your_name.size > 10
      display_invalid_name
    end
    your_name.strip
  end

  def prompt_choose_marker
    answer = nil
    loop do
      puts "Choose any alphabetic letter as a marker:"
      answer = gets.chomp
      break if VALID_MARKERS.include?(answer.upcase)
      display_invalid_input
    end
    clear_screen
    answer.upcase
  end

  def prompt_choose_move(board, human)
    square = ''
    puts "Press ENTER to pick a random square or"
    puts "Choose from: (#{joinor(board.unmarked_keys)})"
    loop do
      square = gets.chomp
      break if board.unmarked_keys.include?(square.to_i) || square == ''
      puts "Invalid input! Try again:"
    end
    set_move(board, human, square)
  end

  def set_move(board, human, square)
    if square == ''
      board[board.unmarked_keys.sample] = human.marker
    else
      board[square.to_i] = human.marker
    end
  end

  private

  def joinor(unmarked_keys)
    if unmarked_keys.empty?
      ''
    elsif unmarked_keys.size == 1
      unmarked_keys.first.to_s
    else
      unmarked_keys[0..-2].join(', ') + ', or ' + unmarked_keys.last.to_s
    end
  end
end

class Computer < Player
  def set_name
    self.name = ['Bishop', 'Chappie', 'Chucky', 'Vision'].sample
  end

  def won_round(computer)
    self.score += 1
    puts "#{computer.name} won this round!"
  end

  def calculate_move(board, human)
    defensive = find_defensive_moves(board, human)
    offensive = find_offensive_moves(board, human)
    offensive_win = find_offensive_winning_moves(board)
    computer_marker = marker
    make_move(board, offensive_win, defensive, offensive, computer_marker)
  end

  # rubocop:disable Metrics/MethodLength
  def make_move(board, offensive_win, defensive, offensive, computer_marker)
    if board.squares[5].marker == " "
      board[5] = computer_marker
    elsif offensive_win
      board[offensive_win] = computer_marker
    elsif defensive
      board[defensive] = computer_marker
    elsif offensive
      board[offensive] = computer_marker
    else
      board[board.unmarked_keys.sample] = computer_marker
    end
  end
  # rubocop:enable Metrics/MethodLength

  private

  def find_defensive_moves(board, human)
    current_board = board_state(board)
    d_moves = []
    current_board.each_with_index do |line, idx|
      if line.count(human.marker) == 2 && line.include?(" ")
        d_moves << Board::WINNING_LINES[idx][line.index(" ")]
      end
    end
    d_moves.sample
  end

  def find_offensive_moves(board, human)
    current_board = board_state(board)
    o_moves = []
    current_board.each_with_index do |line, line_idx|
      if line.uniq.size == 2 && !line.include?(human.marker)
        line.each_with_index do |square, sq_idx|
          o_moves << Board::WINNING_LINES[line_idx][sq_idx] if square == " "
        end
      end
    end
    o_moves.sample
  end

  def find_offensive_winning_moves(board)
    current_board = board_state(board)
    o_winning_moves = []
    current_board.each_with_index do |line, idx|
      if line.count(marker) == 2 && line.include?(" ")
        o_winning_moves << Board::WINNING_LINES[idx][line.index(" ")]
      end
    end
    o_winning_moves.sample
  end

  def board_state(board)
    Board::WINNING_LINES.map do |line|
      line.map do |square|
        board.squares[square].marker
      end
    end
  end
end

class TTTGame
  include Displayable

  attr_accessor :first_to_move, :current_marker
  attr_reader :board, :human, :computer, :human_marker, :computer_marker

  def initialize
    @board = Board.new
    @human = Human.new
    @computer = Computer.new
  end

  def game
    display_welcome_message
    loop do
      game_setup
      game_play
      display_game_result
      break unless play_again?
      reset_game!
      display_play_again_message
    end
    display_goodbye_message
  end

  private

  def game_setup
    board.reset!
    @human_marker = human.assign_marker(human.prompt_choose_marker)
    random_available_marker = (VALID_MARKERS - [human_marker]).sample
    @computer_marker = computer.assign_marker(random_available_marker)
    @first_to_move = assign_first_to_move
    @current_marker = first_to_move
  end

  def assign_first_to_move
    case prompt_first_to_move
    when 1 then human_marker
    when 2 then computer_marker
    when 3 then [human_marker, computer_marker].sample
    end
  end

  def prompt_first_to_move
    choice = nil
    loop do
      display_first_to_move
      choice = gets.to_i
      break if [1, 2, 3].include?(choice)
      display_invalid_input
    end
    choice
  end

  def game_play
    loop do
      clear_screen_display_markers_board
      player_move
      round_results
      prompt_continue
      break if max_score_reached?
      reset_round!
    end
  end

  def player_move
    loop do
      current_player_moves
      break if board.someone_won? || board.full?
      clear_screen_display_markers_board
    end
  end

  def current_player_moves
    if current_marker == human_marker
      human.prompt_choose_move(board, human)
      self.current_marker = computer_marker
    else
      computer.calculate_move(board, human)
      self.current_marker = human_marker
    end
  end

  def round_results
    clear_screen_display_markers_board
    case board.winning_marker
    when human.marker    then human.won_round(human)
    when computer.marker then computer.won_round(computer)
    else                      Player.tie_round(human, computer)
    end
    display_current_score
  end

  def max_score_reached?
    human.score == MAX_SCORE || computer.score == MAX_SCORE
  end

  def reset_round!
    board.reset!
    assign_first_to_move_next_round
  end

  def assign_first_to_move_next_round
    if @first_to_move == human_marker
      @current_marker = computer_marker
      @first_to_move = computer_marker
    else
      @current_marker = human_marker
      @first_to_move = human_marker
    end
  end

  def reset_game!
    board.reset!
    Player.reset_scores!(human, computer)
  end

  def play_again?
    answer = nil
    loop do
      puts "Would you like to play again? (y/n)"
      answer = gets.chomp.downcase
      break if ['y', 'n'].include?(answer)
      display_invalid_input
    end
    answer == 'y'
  end
end

TTTGame.new.game
