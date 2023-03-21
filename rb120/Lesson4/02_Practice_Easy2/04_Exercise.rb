class BeesWax
  attr_accessor :type # Creates both getter and setter methods automatically

  def initialize(type)
    @type = type
  end

  # def type
  #   @type
  # end

  # def type=(t)
  #   @type = t
  # end

  def describe_type
    puts "I am a #{type} of Bees Wax" # Removed @ in front of type, now references the getter method for type
  end
end
