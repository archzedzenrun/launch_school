# Closures
A `closure` is a chunk of code that creates a binding of its surrounding context (e.g. variables and methods and their scope), which is referenced when the closure is executed at a later time.

```ruby
# Closure Example:

def message_reader(&block)
  block.call.upcase! # block represents a closure
end

message = "Hello from the top level scope"
message_reader { message } # local variable message represents the binding
puts message # mutated from within the scope of the block
# proc object invoked inside a method has access to the message variable defined in an outer scope.
```
Closures in Ruby are implemented through blocks, procs, and lambdas.

A `binding` refers to a closure's surrounding context, including but not limited to local variables, constants, methods and their scope, which is referenced at execution time.

The scope of the closure is determined by the artifacts associated with it when it was defined, allowing the closure to access data that may normally be out of scope.
```ruby
def say(block)
  message = "Hello from the say method scope"
  prock = proc { puts message }
  prock.call
  block.call
end

message = "Hello from main scope"
block = Proc.new { puts message }
say(block)
```

# Blocks

Blocks are chunks of code surrounded by curly braces or do/end that are passed as arguments into methods.

Note: Whether or not a block is passed, the number of arguments passed to the method need to match the method definition.

All methods in Ruby can be passed an optional block as an implicit argument.

Using the `yield` keyword inside a method allows us to execute the passed in block argument.

Not passing a block to a method that uses the yield keyword will result in a LocalJumpError.

Not passing a block to a method invoking the call method on an explicit block argument will result in an error.

Using the `block_given?` method gives us the flexibility to only yield if a block was passed to the method (making the block argument optional).

A block parameter allows arguments to be passed to the block.

Similar to methods, blocks have a return value when they are executed which is determined by the last expression in the block.

**When to use blocks in your methods?**

Using blocks improves flexibility by allowing us to create more generic methods. This lets the method user decide what kind of functionality they would like to get out of a method at method invocation.

```ruby
def select(arr)
  arr.each_with_object([]) do |ele, results|
    results << ele if yield(ele)
  end
end

arr = [1, 2, 3, 4, 5]
select(arr) { |n| n > 3}

def say
  puts yield
end

say { 'message' }
```
Blocks can also be useful for methods that need to perform some kind of before and after action, known as sandwich code. Again we leave it up to the method user to determine what that action will be.
```ruby
def make_burger
  puts "Lets make a burger!"
  puts "Bottom Bun"
  yield
  puts "Top Bun"
  puts "Enjoy your burger!"
end

make_burger do
  puts "Meat"
  puts "Cheese"
end
```

# Methods and explicit block parameters

The block gets assigned to an explicit block parameter and can be treated like any other object, allowing it to be reassigned, passed to other methods, etc.

We use the `&` operator at the beginning of the parameter name to define an explicit block. This converts the block into a proc object.

The `call` method executes the block associated with a proc object. Arguments passed to the call method are passed to the proc/block.

Methods can't return blocks but they can return procs or lambdas.
```ruby
def name_list(list)
  proc do |name|
    list << name
    list
  end
end
list = []
names = name_list(list)
names.call('jesse')
names.call('walter')
names
```

# Blocks and Variable Scope

A block creates a new scope for variables defined within the block. Local variables defined in an outer scope are accessible from within a block. Again, the surrounding environment (including variables) make up the binding of a closure.

Note: Local variables need to be initialized before a closure is created in order to be accessible by that closure. Any changes made to those variables afterwards will be reflected in the binding of the closure.

# Symbol to proc

Is a shortcut when calling methods with blocks.
```ruby
# Example:
[1, 2, 3].map(&:to_s)

# &:to_s tells ruby to convert the symbol :to_s into a block.

# :to_s is not a proc, so ruby first calls Symbol#to_proc to convert the symbol to a proc.

# Ruby then converts this proc to a block.

# &:to_s is the same as { |n| n.to_s }

a_proc = :to_s.to_proc
[1, 2, 3].map(&a_proc)
```
Applying the `&` operator at method invocation tries to convert the object to a block. If the object is already a proc, it will be converted into a block. If its not a proc, it will first try to convert it into a proc before being converted into a block.

Note: This doesnt work for methods that take arguments.

# Arity

`arity` is the rule regarding how many arguments must be passed to a method/block/proc/lambda.

Blocks and procs have `lenient arity` meaning you can pass them more or less arguments than expected without resulting in an error. Extra arguments wont be used, and unused arguments will have a value of nil.
```ruby
def greeting
  yield('hello')
end

greeting { |greet1, greet2| puts "#{greet1}, #{greet2}!" }

# block takes 2 arguments, only 1 used, other is nil.

def greeting
  yield('hello', 'hi')
end

greeting { |greet1| puts "#{greet1}!" }

# block takes 1 argument, 2 provided, only 1 used.
```

Methods and lambdas have `strict arity` meaning you must pass the exact number of expected arguments.
```ruby
def greeting(greeting)
  puts greeting
end

greeting

# Passing less arguments than expected to a method results in error.

def greeting(greeting1)
  puts greeting1
end

greeting(greeting1, greeting2)

# Passing more arguments than expected to a method results in error.
```
Arity rules do not apply to optional arguments.

# Testing With Minitest

Minitest is a bundled gem included with Ruby by default.

RSpec allows you to write code that reads more like English but is not as simple as Minitest.

**Test suite** is the entire set of tests that will run for your project.

**Test** describes the testing of a certain part of the project. A test can contain more than one assertion.

**Assertion** verifies that the data returned by a particular test matches what you expect. There are many different types of assertions with `assert_equal` being one of the most popular (tests for value equality, determined by the == method).

Note: Refutations are the opposite of assertions, they refute instead of assert. These are rarely used.

The **seat approach** is a series of steps to writing a test.

* Setup - Sets up necessary test objects required to run tests. Reduces redundant code throughout the test suite.
* Execute - Running the code from the main program
* Assert - Verifies the executed code give us the expected results.
* Tear down - Cleans up anything that may need closing.

The `setup` and `teardown` methods are invoked before and after every test respectively.

**Code coverage** refers to how much of the program is tested in the test suite.

# Core Tools/Packaging Code

Core tools assist developers in creating and maintaining programs.

* **Gems** are packages of code that can be used in Ruby programs.
* **Ruby Version Managers** allow you to install and use multiple versions of Ruby (gems have to be installed for each Ruby version).
* **Bundler** is a gem that allows you to define which Ruby version and Gems a project needs to function. It uses the Gemfile to determine this. It also allows you to install all necessary files a program requires.
* **Gemfiles** lists what dependencies (Ruby versions or Gems) your project requires.
* **Gemfile.lock** Created by bundler (bundle install) that lists the dependencies your program requires, including gem dependencies. Based on the gemfile.
* **Git** Is a source control management tool that stores files in a repository. Github is an online location for storing these repositories.
* **Rake** is a gem that automates development tasks such as building/packaging, testing, or installing programs. These tasks are defined in the **Rakefile**.