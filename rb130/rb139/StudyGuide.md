# Closures
A `closure` is a chunk of code that binds its surroundings (variables and methods),  which can then be passed around and executed at a later time.

Closures in Ruby are implemented through blocks, procs, and lambdas.

A closure's `binding` refers to the data associated with that chunk of code.

# Blocks

When invoking a method with a block, the block is being passed to the method as an argument. Its up to the method implementation to decide what to do with the block.

Note: Whether or not a block is passed, the number of arguments passed to the method need to match the method definition.

All methods in Ruby can be passed an optional block as an implicit argument.

Using the `yield` keyword inside a method allows us to execute the passed in block argument.

Not passing a block to a method using the yield keyword will result in a LocalJumpError.

Using the `block_given?` method gives us the flexibility to only yield if a block was passed to the method (making the block argument optional).

A block parameter allows arguments to be passed to the block.

Similar to methods, blocks have a return value when they are executed which is determined by the last expression in the block.

**When to use blocks in your methods?**

Using blocks improves flexibility by allowing us to create more generic methods, allowing the method user to define what kind of additional functionality they would like to get out of a method.

Blocks can also be useful for methods that need to perform some kind of before and after action, or sandwich code. Again we leave it up to the method user to determine what that action will be.

# Methods and explicit block parameters

An explicit block gets assigned to a named parameter and can be treated like any other object, allowing it to be reassigned, passed to other methods, etc.

We use the `&` character to the beginning of the parameter name to define an explicit block. This converts the block into a proc object.

The `call` method invokes a proc object. Arguments passed to the call method are passed to the proc/block.

* What does it mean to invoke a proc object? Are we invoking the block contained within the proc object?

Methods can't return blocks but they can return procs or lambdas.

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
Applying the `&` operator tries to convert the object to a block. If the object is already a proc, it will be converted into a block. If its not a proc, it will first be converted into a proc before being converted into a block.

Note: This doesnt work for methods that take arguments.

# Arity

`arity` is the rule regarding how many arguments must be passed to a method/block/proc/lambda.

Blocks and procs have `lenient arity` meaning you can pass them more or less arguments than expected without resulting in an error. Extra arguments wont be used, and unused arguments will be nil.

Methods and lambdas have `strict arity` meaning you must pass the exact number of expected arguments.

Arity rules do not apply to optional arguments.

# Testing With Minitest

Minitest is a bundled gem included with Ruby by default.

RSpec allows you to write code that reads more like English but is not as simple as Minitest.

**Test suite** is the entire set of tests that will run for your project.

**Test** describes the testing of a certain part of the project. A test can contain more than one assertion.

**Assertion** verifies that the data returned by a particular test matches what you expect. There are many different types of assertions with `assert_equal` being one of the most popular (tests for value equality, determined by the == method).

Note: Refutations are the opposite of assertions, they refute instead of assert. These are rarely used.

The **seat approach** is a series of steps to writing a test.

* Setup - Setting up necessary test objects.
* Execute - Runs the tests we have defined.
* Assert - Assert the tests do what we expect.
* Tear down - Cleans up anything that may need closing.

The `setup` and `teardown` methods are invoked before and after each test respectively.

**Code coverage** refers to how much of the program is tested in the test suite.

# Core Tools/Packaging Code

* **Gems** are packages of code that can be used in Ruby programs.
* **Ruby Version Managers** allow you to install and use multiple versions of Ruby (gems have to be installed for each Ruby version).
* **Bundler** is a gem that allows you to define which Ruby version and Gems a project needs to function. It uses the Gemfile to determine this.
* **Gemfiles** lists what Ruby versions or Gems your project requires.
* **Rake** is a gem that automates development tasks such as building/packaging, testing, or installing programs. These tasks are defined in the **Rakefile**.