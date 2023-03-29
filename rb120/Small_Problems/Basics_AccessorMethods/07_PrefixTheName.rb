class Person
  attr_writer :name

  def name # manual getter method needed for additional functionality
    "Mr. #{@name}"
  end
end

person1 = Person.new
person1.name = 'James'
puts person1.name