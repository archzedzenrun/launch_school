class Cat
  attr_accessor :type, :age

  def initialize(type)
    @type = type
    @age  = 0
  end

  def make_one_year_older
    @age += 1
  end
end

new = Cat.new("tabby")
puts new.age

=begin
`self.age` could be replaced with `@age`, which points directly to the value of
that instance variable.
=end