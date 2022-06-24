VALID_CHOICES = ['rock', 'paper', 'scissors']

def prompt(message)
  puts "=> #{message}"
end

def winner?(player, computer)
  (player == 'rock' && computer == 'scissors') ||
    (player == 'paper' && computer == 'rock') ||
    (player == 'scissors' && computer == 'paper')
end

def display_results(player, computer)
  if winner?(player, computer)
    prompt('You won!')
  elsif winner?(computer, player)
    prompt('Computer won!')
  else
    prompt("It's a tie!")
  end
end

loop do
  choice = ''
  loop do
    prompt("Choose one: #{VALID_CHOICES.join(', ')}")
    choice = gets.chomp
    break if VALID_CHOICES.include?(choice)
    prompt("That's not a valid choice.")
  end

  computer_choice = VALID_CHOICES.sample

  prompt("You chose #{choice}. Computer chose #{computer_choice}.")
  display_results(choice, computer_choice)
  
  prompt("Would you like to play again? Y or N")
  play_again = gets.chomp
  break unless play_again.downcase == 'y'
end

prompt('Thanks for playing. Goodbye.')
