class AngryCat
  def initialize(age, name)
    @age  = age
    @name = name
  end

  def age
    puts @age
  end

  def name
    puts @name
  end

  def hiss
    puts "Hisssss!!!"
  end
end

cat1 = AngryCat.new(6, 'pip')
cat2 = AngryCat.new(5, 'mia')

# cat1 and cat2 point to 2 different instances of the AngryCat class