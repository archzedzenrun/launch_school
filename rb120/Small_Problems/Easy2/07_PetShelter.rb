class Pet
  attr_reader :type, :name

  def initialize(type, name)
    @type = type
    @name = name
  end
end

class Owner < Pet
  @@adoptions = Hash.new {|k, v| k[v] = []}

  attr_reader :name

  def initialize(name)
    @name = name
  end

  def number_of_pets
    @@adoptions[name].size
  end
end

class Shelter < Owner
  def initialize
  end

  def adopt(owner, pet)
    @@adoptions[owner.name] << [pet.type, pet.name]
  end

  def print_adoptions
    @@adoptions.each do |owner, pets|
      puts "#{owner} has adopted the following pets:"
      pets.each do |pet_details|
        puts "a #{pet_details[0]} named #{pet_details[1]}"
      end
    end
  end
end


butterscotch = Pet.new('cat', 'Butterscotch')
pudding      = Pet.new('cat', 'Pudding')
darwin       = Pet.new('bearded dragon', 'Darwin')
kennedy      = Pet.new('dog', 'Kennedy')
sweetie      = Pet.new('parakeet', 'Sweetie Pie')
molly        = Pet.new('dog', 'Molly')
chester      = Pet.new('fish', 'Chester')

phanson = Owner.new('P Hanson')
bholmes = Owner.new('B Holmes')

shelter = Shelter.new
shelter.adopt(phanson, butterscotch)
shelter.adopt(phanson, pudding)
shelter.adopt(phanson, darwin)
shelter.adopt(bholmes, kennedy)
shelter.adopt(bholmes, sweetie)
shelter.adopt(bholmes, molly)
shelter.adopt(bholmes, chester)
shelter.print_adoptions
puts "#{phanson.name} has #{phanson.number_of_pets} adopted pets."
puts "#{bholmes.name} has #{bholmes.number_of_pets} adopted pets."