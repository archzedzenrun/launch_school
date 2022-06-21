def prompt(message)
  puts "=> #{message}"
end

prompt 'Welcome to the mortgage calculator!'

loop do
  loan_amount = ''
  loop do
    prompt 'What is the loan amount?'
    loan_amount = gets.chomp
    break unless loan_amount.empty? || loan_amount.to_i < 0
    prompt 'Must enter a positive number.'
  end
  interest_rate = ''
  loop do
    prompt 'What is the interest rate? (Example: 5 for 5%)'
    interest_rate = gets.chomp
    break unless interest_rate.empty? || interest_rate.to_f < 0
    prompt 'Must enter a positive number.'
  end
  loan_duration_years = ''
  loop do
    prompt 'What is the loan duration? (in years)'
    loan_duration_years = gets.chomp
    break unless loan_duration_years.empty? || loan_duration_years.to_i < 0
    prompt 'Invalid input'
  end

  annual_interest_rate = interest_rate.to_f / 100
  monthly_interest_rate = annual_interest_rate.to_f / 12
  loan_duration_months = loan_duration_years.to_f * 12
  monthly_payment = loan_amount.to_f * (monthly_interest_rate /
                    (1 - (1 + monthly_interest_rate)**(-loan_duration_months)))

  prompt("Your monthly payment is #{monthly_payment}")
  prompt('Would you like to make another calculation? (Y for yes)')
  another_calculation = gets.chomp.downcase
  break if another_calculation != 'y'
end

prompt('Thank you for using the mortgage calculator')
