require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

require_relative 'cash_register'
require_relative 'transaction'

class CashRegisterTest < MiniTest::Test
  def setup
    @register = CashRegister.new(100)
    @transaction = Transaction.new(50)
  end

  def test_accept_money
    @transaction.amount_paid = 50
    @register.accept_money(@transaction)
    assert_equal(150, @register.total_money)
  end

  def test_change
    @transaction.amount_paid = 75
    assert_equal(25, @register.change(@transaction))
  end

  def test_give_receipt
    assert_output("You've paid $#{@transaction.item_cost}.\n") do
      @register.give_receipt(@transaction)
    end
  end

  def test_prompt_for_payment
    amount = StringIO.new("75\n")
    @transaction.prompt_for_payment(input: amount, output: StringIO.new)
    assert_equal(75, @transaction.amount_paid)
  end
end