FULL_DECK = [['Club', 2], ['Club', 3], ['Club', 4], ['Club', 5], ['Club', 6], ['Club', 7],
             ['Club', 8], ['Club', 9], ['Club', 10], ['Club', 'J'], ['Club', 'Q'],
             ['Club', 'K'], ['Club', 'A'], ['Diamond', 2], ['Diamond', 3], ['Diamond', 4],
             ['Diamond', 5], ['Diamond', 6], ['Diamond', 7], ['Diamond', 8],
             ['Diamond', 9], ['Diamond', 10], ['Diamond', 'J'], ['Diamond', 'Q'],
             ['Diamond', 'K'], ['Diamond', 'A'], ['Heart', 2], ['Heart', 3], ['Heart', 4],
             ['Heart', 5], ['Heart', 6], ['Heart', 7], ['Heart', 8], ['Heart', 9],
             ['Heart', 10], ['Heart', 'J'], ['Heart', 'Q'], ['Heart', 'K'],
             ['Heart', 'A'], ['Spade', 2], ['Spade', 3], ['Spade', 4], ['Spade', 5],
             ['Spade', 6], ['Spade', 7], ['Spade', 8], ['Spade', 9], ['Spade', 10],
             ['Spade', 'J'], ['Spade', 'Q'], ['Spade', 'K'], ['Spade', 'A']]

def prompt(msg)
  puts ">> #{msg}"
end

def total(cards)
  sum = 0
  values = cards.map { |card| card[1] }
  values.each do |value|
    if value == 'A'
      sum += 11
    elsif value.to_i.zero?
      sum += 10
    else
      sum += value
    end
  end
  values.select { |value| value == 'A' }.count.times do
    sum -= 10 if sum > 21
  end
  sum
end

def busted?(cards)
  total(cards) > 21
end

def display_results(dealer_cards, player_cards)
  player_total = total(player_cards)
  dealer_total = total(dealer_cards)

  if player_total > 21
    prompt 'Player busted. Dealer wins.'
  elsif dealer_total > 21
    prompt 'Dealer busted. Player wins.'
  elsif dealer_total < player_total
    prompt 'Player wins.'
  elsif dealer_total > player_total
    prompt 'Dealer wins.'
  else
    prompt "It's a tie."
  end
end

def play_again?
  prompt 'Do you want to play again? y or n'
  answer = gets.chomp.downcase
  answer == 'y'
end

loop do
  prompt 'Welcome to Twenty-One!'

  deck = FULL_DECK.shuffle!
  dealer_cards = []
  player_cards = []

  2.times { dealer_cards << deck.pop }
  2.times { player_cards << deck.pop }

  if total(dealer_cards) == 21
    prompt "Dealer has #{dealer_cards[0]} and hidden card"
    prompt "Player has #{player_cards}"
    prompt "Dealer reveals #{dealer_cards} totaling 21"
    prompt 'Dealer wins!'
    play_again? ? next : break
  elsif total(player_cards) == 21
    prompt "Dealer reveals #{dealer_cards[0]} and #{dealer_cards[1]}"
    prompt "Player has #{player_cards[0]} and #{player_cards[1]} totaling 21"
    prompt 'Player wins!'
    play_again? ? next : break
  else
    prompt "Dealer has #{dealer_cards[0]} and hidden card"
    prompt "Player has #{player_cards} totaling #{total(player_cards)}"
  end

  # Player turn
  loop do
    player_turn = ''
    loop do
      prompt 'Would you like to hit or stay? (h for hit, s for stay)'
      player_turn = gets.chomp.downcase
      break if 'hs'.include?(player_turn)

      prompt 'Invalid input'
    end

    if player_turn == 'h'
      player_cards << deck.pop
      prompt 'Player hits'
      prompt "Your cards are now #{player_cards}"
      prompt "Your total is now #{total(player_cards)}"
    end

    break if player_turn == 's' || busted?(player_cards)
  end

  if busted?(player_cards)
    display_results(dealer_cards, player_cards)
    play_again? ? next : break
  else
    prompt "You stay at #{total(player_cards)}"
  end

  # Dealer turn
  loop do
    break if total(dealer_cards) >= 17

    prompt 'Dealer hits.'
    dealer_cards << deck.pop
    prompt "Dealer's cards are now #{dealer_cards} totaling #{total(dealer_cards)}"
  end

  if busted?(dealer_cards)
    display_results(dealer_cards, player_cards)
    play_again? ? next : break
  else
    prompt "Dealer stays at #{total(dealer_cards)}"
  end

  prompt '====================='
  prompt "Dealer's total is #{total(dealer_cards)}"
  prompt "Your total is #{total(player_cards)}"
  prompt '====================='
  display_results(dealer_cards, player_cards)

  break unless play_again?
end

prompt 'Thanks for playing Twenty-One!'
