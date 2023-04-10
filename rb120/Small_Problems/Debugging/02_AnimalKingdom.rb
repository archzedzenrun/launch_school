class Animal
  def initialize(diet, superpower)
    @diet = diet
    @superpower = superpower
  end

  def move
    puts "I'm moving!"
  end

  def superpower
    puts "I can #{@superpower}!"
  end
end

class Fish < Animal
  def move
    puts "I'm swimming!"
  end
end

class Bird < Animal
end

class FlightlessBird < Bird
  def initialize(diet, superpower)
    super
  end

  def move
    puts "I'm running!"
  end
end

class SongBird < Bird
  def initialize(diet, superpower, song)
    super(diet, superpower) # passing diet and superpower as arguments
    @song = song
  end

  def move
    puts "I'm flying!"
  end
end

# Examples

unicornfish = Fish.new(:herbivore, 'breathe underwater')
penguin = FlightlessBird.new(:carnivore, 'drink sea water')
robin = SongBird.new(:omnivore, 'sing', 'chirp chirrr chirp chirp chirrrr')

=begin
On line 37, `super` is trying to send all 3 arguments to the `initialize` method
in the superclass `Bird` (which subclasses from `Animal`). The `initialize` method
in `Animal` is only expecting 2 arguments so we only pass the diet and superpower
arguments to the `initialize` method in the superclass. The third argument
will be set to the instance variable `song` in the `SongBird` class.

Further Exploration:
As is, the `initialize` in the `FlightlessBird` class is unnecessary because
this class inherits from `Bird` which inherts from `Animal` where the `initialize`
method is doing the same thing.
=end