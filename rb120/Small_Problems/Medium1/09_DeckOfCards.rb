class Card
  include Comparable

  CARD_RANKS = {'Jack' => 11, 'Queen' => 12, 'King' => 13,
               'Ace' => 14 }
  SUIT_RANKS = {'Diamonds' => 1, 'Clubs' => 2, 'Hearts' => 3, 'Spades' => 4}

  attr_reader :rank, :suit

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def <=>(other_card)
    if value == other_card.value # Further Exploration
      SUIT_RANKS[suit] <=> SUIT_RANKS[other_card.suit]
    else
      value <=> other_card.value
    end
  end

  def value
    CARD_RANKS.keys.include?(rank) ? CARD_RANKS[rank] : rank
  end

  def to_s
    "#{rank} of #{suit}"
  end
end

class Deck
  RANKS = ((2..10).to_a + %w(Jack Queen King Ace)).freeze
  SUITS = %w(Hearts Clubs Diamonds Spades).freeze

  attr_accessor :deck

  def initialize
    @deck = create_deck
  end

  def create_deck
    deck = []
    SUITS.each do |suit|
      RANKS.each do |rank|
        deck << Card.new(rank, suit)
      end
    end
    deck.shuffle!
  end

  def draw
    reset if deck.empty?
    deck.pop
  end

  private

  def reset
    self.deck = create_deck
  end
end

deck = Deck.new
drawn = []
52.times { drawn << deck.draw }
p drawn.count { |card| card.rank == 5 } == 4
p drawn.count { |card| card.suit == 'Hearts' } == 13

drawn2 = []
52.times { drawn2 << deck.draw }
p drawn != drawn2 # Almost always.