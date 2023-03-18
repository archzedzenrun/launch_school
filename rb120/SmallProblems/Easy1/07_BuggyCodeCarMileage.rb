class Car
  attr_accessor :mileage

  def initialize
    @mileage = 0
  end

  def increment_mileage(miles)
    total = mileage + miles
    self.mileage = total # added self. to mileage, treats mileage as a local variable without
  end

  def print_mileage
    puts mileage
  end
end

car = Car.new
car.mileage = 5000
car.increment_mileage(678)
car.print_mileage  # should print 5678

=begin
self is preffered because it invokes the mileage setter method which
may contain additional functionality that we may want to apply when
setting mileage to a new total. Setting the mileage instance variable directly
using @mileage = total bypasses the invoking of the setter method.
=end