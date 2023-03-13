=begin
4)  Using the class definition from step #3, let's create a few more people
    -- that is, Person objects.

      bob = Person.new('Robert Smith')
      rob = Person.new('Robert Smith')

      If we're trying to determine whether the two objects contain the same name,
      how can we compare the two objects?
=end

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
