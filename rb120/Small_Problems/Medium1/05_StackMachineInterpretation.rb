class InvalidToken < StandardError; end
class EmptyStack < StandardError; end

class Minilang
  VALID_COMMANDS = ['PUSH', 'ADD', 'SUB', 'MULT', 'DIV', 'MOD', 'POP',
                    'PRINT']

  attr_reader :sequence
  attr_accessor :register, :stack

  def initialize(string)
    @register = 0
    @stack = []
    @sequence = string
  end

  def eval
    sequence.split.each do |command|
      if valid_number?(command)
        assign_register(command)
        next
      end

      case command
      when 'PUSH'  then push
      when 'ADD'   then add
      when 'SUB'   then subtract
      when 'MULT'  then multiply
      when 'DIV'   then divide
      when 'MOD'   then mod
      when 'POP'   then pop
      when 'PRINT' then print_register
      else              invalid_command(command)
      end
    end
  end

  def invalid_command(command)
    begin
      raise InvalidToken, "Invalid token: #{command}"
    rescue => e
      puts e.message
    end
  end

  def valid_number?(command)
    command =~ /\A[-+]?\d+\z/
  end

  def push
    stack << register
  end

  def add
    self.register += stack.pop
  end

  def subtract
    self.register -= stack.pop
  end

  def multiply
    self.register *= stack.pop
  end

  def divide
    self.register /= stack.pop
  end

  def mod
    self.register %= stack.pop
  end

  def pop
    empty_stack?
    self.register = stack.pop
  end

  def empty_stack?
    begin
      raise EmptyStack, "Empty Stack!" if stack.empty?
    rescue => e
      puts e.message
    end
  end

  def print_register
    puts register if register
  end

  def assign_register(command)
    self.register = command.to_i
  end
end

Minilang.new('PRINT').eval
# 0

Minilang.new('5 PUSH 3 MULT PRINT').eval
# # 15

Minilang.new('5 PRINT PUSH 3 PRINT ADD PRINT').eval
# # 5
# # 3
# # 8

Minilang.new('5 PUSH 10 PRINT POP PRINT').eval
# # 10
# # 5

Minilang.new('5 PUSH POP POP PRINT').eval
# # Empty stack!

Minilang.new('3 PUSH PUSH 7 DIV MULT PRINT ').eval
# # 6

Minilang.new('4 PUSH PUSH 7 MOD MULT PRINT ').eval
# # 12

Minilang.new('-3 PUSH 5 XSUB PRINT').eval
# # Invalid token: XSUB

Minilang.new('-3 PUSH 5 SUB PRINT').eval
# # 8

Minilang.new('6 PUSH').eval
#(nothing printed; no PRINT commands)
