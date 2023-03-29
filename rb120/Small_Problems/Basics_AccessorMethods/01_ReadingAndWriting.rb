class Person
  attr_accessor :name # creates both getter and setter methods
end

person1 = Person.new
person1.name = 'Jessica'
puts person1.name
