class Person
  def name=(full_name)
    full_name = full_name.split
    @first_name = full_name.first
    @last_name = full_name.last
  end

  def name
    "#{@first_name} #{@last_name}"
  end
end

person1 = Person.new
person1.name = 'John Doe'
puts person1.name