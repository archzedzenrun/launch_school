module Speed
  def go_fast
    puts "I am a #{self.class} and going super fast!"
  end
end

class Car
  include Speed # <----
  def go_slow
    puts "I am safe and driving slow."
  end
end

class Truck
  include Speed # <----
  def go_very_slow
    puts "I am a heavy truck and like going very slow."
  end
end

Car.new.go_fast
Truck.new.go_fast

=begin
The Car and Truck classes can acess the go_fast method by including (mixing in)
the Speed module. You can make sure the method is accessible by invoking it on
an instance of either class.
=end