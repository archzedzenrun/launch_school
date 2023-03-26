class BankAccount
  attr_reader :balance

  def initialize(starting_balance)
    @balance = starting_balance
  end

  def positive_balance?
    balance >= 0
  end
end

=begin
Ben is right because `balance` on line 9 invokes the getter method for
the `balance` instance variable.
=end