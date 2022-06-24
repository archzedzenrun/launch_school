VALID_CHOICES = ['rock', 'paper', 'scissors']

def prompt(message)
  puts "=> #{message}"
end

def winner?(player, computer)
  (player == 'rock' && computer == 'scissors') ||
    (player == 'paper' && computer == 'rock') ||
    (player == 'scissors' && computer == 'paper')
end

loop do
  player_choice = ''
  player_score = 0
  computer_score = 0
  prompt("Welcome to Rock, Paper, Scissors. First to 3 wins.")
  loop do
    prompt("Choose one: #{VALID_CHOICES.join(', ')}")
    player_choice = gets.chomp
    if !VALID_CHOICES.include?(player_choice)
      prompt("Invalid choice")
      next
    end

    computer_choice = VALID_CHOICES.sample
    prompt("You chose #{player_choice}. Computer chose #{computer_choice}.")

    if winner?(player_choice, computer_choice)
      prompt('You win this round')
      player_score += 1
    elsif winner?(computer_choice, player_choice)
      prompt('Computer wins this round')
      computer_score += 1
    else
      prompt('You tied this around')
    end
    prompt("Player score: #{player_score} Computer score: #{computer_score}")

    if player_score == 3
      prompt('You won the game!')
      break
    elsif computer_score == 3
      prompt('Computer won the game!')
      break
    end
  end

  prompt("Would you like to play again? Y or N")
  play_again = gets.chomp
  break unless play_again.downcase == 'y'
  system('clear')
end

prompt('Thanks for playing. Goodbye.')
