class Greeting
  def greet(message)
    puts message
  end
end

class Hello < Greeting
  def hi
    greet("Hello")
  end
end

class Goodbye < Greeting
  def bye
    greet("Goodbye")
  end
end

hello = Hello.new
hello.hi

=begin
In this case the local variable `hello` is set to a new instance of the `Hello`
class. The `hi` method is invoked on `hello` which is found in the `Hello` class.
Within the `hi` method, the `greet` method is invoked and passed the string "hello"
There is no `greet` method found in the `Hello` class, Ruby then looks in the
next place in the method lookup path which is the `Greeting` class. It finds
the `greet` method which outputs the argument that was passed. hello.hi will output
"Hello"
=end

hello = Hello.new
hello.bye

=begin
This will result in an error because there is no `bye` method defined in the `Hello` class
method lookup path.
=end

hello = Hello.new
hello.greet

=begin
This will result in an error because the greet method is found in the `Greeting`
class and takes 1 argument. No argument was passed when invoking `greet` on `hello`.
=end

hello = Hello.new
hello.greet("Goodbye")

=begin
This is the same as the last case but this time an argument was passed to `greet`
which is what will be output. "Goodbye"
=end

Hello.hi

=begin
This will result in an error because invoking a method on the class itself
means that it will be looking for a class method named `hi` but in this case
the only `hi` method is an instance method which can only be invoked on
instances of the class, not the class itself.
=end