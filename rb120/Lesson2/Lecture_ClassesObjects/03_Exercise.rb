=begin
3)  Now create a smart name= method that can take just a first name or a full
    name, and knows how to set the first_name and last_name appropriately.
      bob = Person.new('Robert')
      bob.name                  # => 'Robert'
      bob.first_name            # => 'Robert'
      bob.last_name             # => ''
      bob.last_name = 'Smith'
      bob.name                  # => 'Robert Smith'

      bob.name = "John Adams"
      bob.first_name            # => 'John'
      bob.last_name             # => 'Adams'
=end

class Person
  attr_accessor :first_name, :last_name

  def initialize(new_name)
    set_name(new_name)
  end

  def name
    @last_name.empty? ? @first_name.strip : "#{first_name} #{last_name}"
  end

  def name=(name)
    set_name(name)
  end

  private

  def set_name(new_name)
    new_name = new_name.split
    @first_name = new_name.first
    @last_name = new_name.size > 1 ? new_name.last : ''
  end
end

bob = Person.new('Robert')
p bob.name                  # => 'Robert'
p bob.first_name            # => 'Robert'
p bob.last_name             # => ''
bob.last_name = 'Smith'
p bob.name                  # => 'Robert Smith'
bob.name = "John Adams"
p bob.first_name            # => 'John'
p bob.last_name             # => 'Adams'
