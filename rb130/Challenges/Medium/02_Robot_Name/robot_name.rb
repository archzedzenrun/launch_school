=begin
*PROBLEM*
Explicit Rules:
-Generate a random robot name that starts wtih 2 upcase
 alphabet letters followed by 3 numbers.
-Dont allow the same name twice.

Implicit Rules:
Robot class
name instance method

*DATA STRUCTURE*
Array to hold all robot names

*ALGORITHM*
name instance method
-Create an empty robot name string
-add two upcase alpha letters to the string
-add 3 random numbers 0-9 to the string
-if stored robot names contains the robot name
  -create a new robot name
  -otherwise return the robot name and add it to the
   stored robot names
=end

class Robot
  attr_reader :name

  @@robot_names = []

  def initialize
    gen_name
  end

  def reset
    initialize
  end

  private

  def gen_name
    robot_name = ''
    2.times { robot_name << ('A'..'Z').to_a.sample }
    3.times { robot_name << rand(9).to_s }
    verify_unique_name(robot_name)
  end

  def verify_unique_name(robot_name)
    if @@robot_names.include?(robot_name)
      gen_name
    else
      @@robot_names << robot_name
      @name = robot_name
    end
  end
end
