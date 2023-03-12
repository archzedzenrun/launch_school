# 1)  Given the below usage of the Person class, code the class definition.
      # bob = Person.new('bob')
      # bob.name                  # => 'bob'
      # bob.name = 'Robert'
      # bob.name                  # => 'Robert'

class Person
  attr_accessor :name

  def initialize(name)
    @name = name
  end
end

# bob = Person.new('bob')
# p bob.name                  # => 'bob'
# bob.name = 'Robert'
# p bob.name                  # => 'Robert'

#==============================================================================

# 2)  Modify the class definition from above to facilitate the following methods.
#     Note that there is no name= setter method now.
      # bob = Person.new('Robert')
      # bob.name                  # => 'Robert'
      # bob.first_name            # => 'Robert'
      # bob.last_name             # => ''
      # bob.last_name = 'Smith'
      # bob.name                  # => 'Robert Smith'

class Person
  attr_reader :first_name
  attr_accessor :last_name

  def initialize(name)
    @first_name = name
    @last_name = ''
  end

  def name
    @first_name + ' ' + @last_name
  end
end

# bob = Person.new('Robert')
# puts bob.name                  # => 'Robert'
# puts bob.first_name            # => 'Robert'
# puts bob.last_name             # => ''
# bob.last_name = 'Smith'
# puts bob.name                  # => 'Robert Smith'

#==============================================================================

# 3)  Now create a smart name= method that can take just a first name or a full
#     name, and knows how to set the first_name and last_name appropriately.
      # bob = Person.new('Robert')
      # bob.name                  # => 'Robert'
      # bob.first_name            # => 'Robert'
      # bob.last_name             # => ''
      # bob.last_name = 'Smith'
      # bob.name                  # => 'Robert Smith'

      # bob.name = "John Adams"
      # bob.first_name            # => 'John'
      # bob.last_name             # => 'Adams'

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

# bob = Person.new('Robert')
# p bob.name                  # => 'Robert'
# p bob.first_name            # => 'Robert'
# p bob.last_name             # => ''
# bob.last_name = 'Smith'
# p bob.name                  # => 'Robert Smith'
# bob.name = "John Adams"
# p bob.first_name            # => 'John'
# p bob.last_name             # => 'Adams'

#==============================================================================

# 4)  Using the class definition from step #3, let's create a few more people
#     -- that is, Person objects.

      #bob = Person.new('Robert Smith')
      #rob = Person.new('Robert Smith')

      #If we're trying to determine whether the two objects contain the same name,
      #how can we compare the two objects?

class Person
  attr_accessor :first_name, :last_name

  def initialize(new_name)
    set_name(new_name)
  end

  def same_name?(other_name) # Using a method to check
    name == other_name.name
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

bob = Person.new('Robert Smith')
rob = Person.new('Robert Smith')
p bob.same_name?(rob)
p bob.name == rob.name # Or just checking here
# Why cant we just do bob == rob ? Both are string objects of the Person class

#==============================================================================

# 5)  Continuing with our Person class definition, what does the below code print out?
      # bob = Person.new("Robert Smith")
      # puts "The person's name is: #{bob}"

# This will print out the object information(?) about the instance bob instead of
# the name. #{bob.name} will properly print the name.

#==============================================================================

# 6)  Let's add a to_s method to the class:

      # class Person
      #   # ... rest of class omitted for brevity

      #   def to_s
      #     name
      #   end
      # end

      # Now, what does the below output?

      # bob = Person.new("Robert Smith")
      # puts "The person's name is: #{bob}"

# Output is:
# The person's name is: Robert Smith

# Ruby calls the Person class to_s method on the interpolated variable bob
# The to_s method has been overwritten to the name method which outputs the
# name of the object it was called on.
