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
  choice = ''
  loop do
    prompt("Choose one: #{VALID_CHOICES.join(', ')}")
    choice = gets.chomp
    break if VALID_CHOICES.include?(choice)
    prompt("That's not a valid choice.")
  end

  computer_choice = VALID_CHOICES.sample

  prompt("You chose #{choice}. Computer chose #{computer_choice}.")

  if winner?(choice, computer_choice)
    prompt('You won!')
  elsif winner?(computer_choice, choice)
    prompt('You lost!')
  else
    prompt("It's a tie!")
  end

  prompt("Would you like to play again?")
  play_again = gets.chomp
  break unless play_again.downcase.start_with?('y')
end

prompt('Thanks for playing. Goodbye.')
