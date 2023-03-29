class Person
  attr_writer :secret

  def share_secret
    puts secret # references the name of the private getter method `secret`
  end

  private

  attr_reader :secret
end

person1 = Person.new
person1.secret = 'Shh.. this is a secret!'
person1.share_secret
