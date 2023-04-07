module Displayable
  def clear_screen
    system('clear')
  end

  def pause
    sleep(3)
  end

  def small_pause
    sleep(1)
  end

  def blank_line
    puts ""
  end

  def display_welcome_message
    clear_screen
    puts "Hello #{player.name}, welcome to Twenty One!"
    blank_line
  end

  def display_invalid_input
    small_pause
    puts 'Invalid input!'
  end

  def display_rules
    clear_screen
    puts rules
    blank_line
    puts 'Press ENTER to begin:'
    gets
  end

  def display_participant_hands
    dealer.display_initial_dealer_hand
    puts '--------------------'
    player.display_hand
  end

  def display_initial_dealer_hand
    puts "#{name} reveals one card, the #{hand[0].rank} of #{hand[0].suit}"
    puts "Total: #{hand[0].value}"
  end

  def display_hand
    puts "#{name}'s hand:"
    hand.each { |card| puts "#{card.rank} of #{card.suit}" }
    puts "Total: #{hand_total}"
  end

  def display_hit_stay
    blank_line
    puts 'Press: 1 to hit, 2 to stay'
  end

  def display_busted
    if player.busted?
      display_player_busted
    elsif dealer.busted?
      display_dealer_busted
    end
    pause
    clear_screen
  end

  def display_game_results
    puts 'Game results:'
    puts "#{dealer.name} - #{dealer.busted? ? 'Busted' : dealer.hand_total}"
    puts "#{player.name} - #{player.busted? ? 'Busted' : player.hand_total}"
    blank_line
    pause
  end

  def display_winner
    case determine_winner
    when 'player_busted' then "#{dealer.name} wins!"
    when 'dealer_busted' then "#{player.name} wins!"
    when 'player'        then "#{player.name} wins!"
    when 'dealer'        then "#{dealer.name} wins!"
    when 'tie'           then "It's a tie!"
    end
  end

  def display_goodbye_message
    clear_screen
    puts "Thanks for playing Twenty-One #{player.name}. Goodbye!"
  end

  private

  def rules
    <<~RULES
    Twenty-One rules:
    -The goal is to get as close to 21 as you can without going over (busting).
    -You will go first, drawing (hit) cards until you decide to stay, or bust.
    -Dealer will then draw until they have a score of at least 17, or bust.
    -If one player busts, the other wins. If both bust, it's a tie.
    -If neither player busts, hand values are compared, determining the winner.
    -Card values:
     2-10 are worth face value, face cards are worth 10, aces are worth 1 or 11.
    RULES
  end

  def display_player_busted
    pause
    blank_line
    puts "#{player.name} busted!"
  end

  def display_dealer_busted
    dealer.display_hand
    blank_line
    pause
    puts "#{dealer.name} busted!"
  end
end

class Deck
  attr_reader :cards

  def initialize
    @cards = create_deck
  end

  def create_deck
    deck = []
    suits = ['Clubs', 'Diamonds', 'Hearts', 'Spades']
    ranks = ('2'..'10').to_a + ['Jack', 'Queen', 'King', 'Ace']
    suits.each do |suit|
      ranks.each do |rank|
        deck << Card.new(suit, rank)
      end
    end
    deck.shuffle
  end

  def deal_card(participant)
    participant.hand << cards.pop
  end
end

class Card
  attr_reader :suit, :rank, :value

  def initialize(suit, rank)
    @suit = suit
    @rank = rank
    @value = assign_value(rank)
  end

  def assign_value(rank)
    if ['Jack', 'Queen', 'King'].include?(rank)
      10
    elsif rank == 'Ace'
      11
    else
      rank.to_i
    end
  end

  def ace?
    rank == 'Ace'
  end
end

class Participant
  include Displayable

  attr_accessor :name, :hand

  def initialize
    set_name
    @hand = []
  end

  def hand_total
    total = hand.map(&:value).sum
    hand.select(&:ace?).count.times do
      break if total <= 21
      total -= 10
    end
    total
  end

  def busted?
    hand_total > 21
  end
end

class Player < Participant
  private

  def set_name
    self.name = prompt_name
  end

  def prompt_name
    your_name = ' '
    loop do
      puts 'What is your name?'
      your_name = gets.chomp
      break unless your_name.strip == '' || your_name.size > 10
      display_invalid_name
    end
    your_name.strip
  end
end

class Dealer < Participant
  private

  def set_name
    random_name = ['Bishop', 'Chappie', 'Chucky', 'Megan'].sample
    self.name = "Dealer #{random_name}"
  end
end

class TwentyOne
  include Displayable

  attr_accessor :deck
  attr_reader :player, :dealer

  def initialize
    @deck = Deck.new
    @player = Player.new
    @dealer = Dealer.new
  end

  def game
    display_welcome_message
    display_rules if prompt_rules?
    play
    display_goodbye_message
  end

  private

  def prompt_rules?
    answer = nil
    loop do
      puts 'Would you like to view the rules? (y/n)'
      answer = gets.chomp.downcase
      break if ['y', 'n'].include?(answer)
      clear_screen
      display_invalid_input
    end
    answer == 'y'
  end

  def play
    loop do
      deal_initial_cards
      display_participant_hands
      participant_turns
      game_results
      break unless play_again?
      reset!
    end
  end

  def deal_initial_cards
    clear_screen
    puts 'Dealing cards...'
    pause
    clear_screen
    2.times do
      deck.deal_card(player)
      deck.deal_card(dealer)
    end
  end

  def participant_turns
    player_turn
    display_busted if player.busted?
    dealer_turn unless player.busted?
    display_busted if dealer.busted?
  end

  def player_turn
    loop do
      move = prompt_player_move
      if move == 2
        player_stay
        break
      else
        player_hit
        break if player.busted?
      end
    end
  end

  def prompt_player_move
    answer = nil
    loop do
      display_hit_stay
      answer = gets.to_i
      break if [1, 2].include?(answer)
      clear_screen
      display_participant_hands
      display_invalid_input
    end
    answer
  end

  def player_stay
    clear_screen
    puts "#{player.name} chose to stay at #{player.hand_total}!"
    blank_line
    pause
    puts "#{dealer.name}'s turn..."
    pause
    clear_screen
  end

  def player_hit
    deck.deal_card(player)
    clear_screen
    puts "#{player.name} chose to hit!"
    blank_line
    small_pause
    player.display_hand
  end

  def dealer_turn
    loop do
      dealer.display_hand
      if dealer.hand_total >= 17 && !dealer.busted?
        dealer_stays
        break
      else
        dealer_hits
        break if dealer.busted?
      end
    end
  end

  def dealer_stays
    pause
    blank_line
    puts "#{dealer.name} stays at #{dealer.hand_total}!"
    pause
    clear_screen
  end

  def dealer_hits
    deck.deal_card(dealer)
    pause
    clear_screen
    puts "#{dealer.name} hit!"
    blank_line
    small_pause
  end

  def game_results
    display_game_results
    determine_winner
    puts display_winner
  end

  def determine_winner
    if participant_busted?
      check_who_busted
    elsif player.hand_total > dealer.hand_total
      'player'
    elsif player.hand_total < dealer.hand_total
      'dealer'
    else
      'tie'
    end
  end

  def participant_busted?
    player.busted? || dealer.busted?
  end

  def check_who_busted
    if player.busted?
      'player_busted'
    elsif dealer.busted?
      'dealer_busted'
    end
  end

  def reset!
    self.deck = Deck.new
    player.hand = []
    dealer.hand = []
  end

  def play_again?
    answer = nil
    loop do
      blank_line
      puts 'Would you like to play again? (y/n)'
      answer = gets.chomp.downcase
      break if ['y', 'n'].include?(answer)
      display_invalid_input
    end
    answer == 'y'
  end
end

TwentyOne.new.game
