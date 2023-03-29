module Mailable
  def print_address
    puts "#{name}"
    puts "#{address}"
    puts "#{city}, #{state} #{zipcode}"
  end
end

class Customer
  include Mailable # Mailable module mixed in

  attr_reader :name, :address, :city, :state, :zipcode
end

class Employee
  include Mailable # Mailable module mixed in

  attr_reader :name, :address, :city, :state, :zipcode
end

betty = Customer.new
bob = Employee.new
betty.print_address
bob.print_address