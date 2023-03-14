```ruby
[1, 2, 3].each do |num|
  puts num
end
```

On `line 1` the `each` method is invoked on an array object with a value of `[1,2,3]`
and passed a do/end block. On `line 2` the `puts` method is invoked and passed the local
variable `num` which will output the current element on each iteration. The output will be
1
2
3
The `each` method returns the object it was called on which is the array `[1,2,3]`.

```ruby
a = "hello"

[1, 2, 3].map { |num| a }
```

On `line 1` the local variable `a` is intiialized to the string `"hello"`.
On `line 3` the `map` method is invoked on an array object with a value of
`[1,2,3]`. The return value of the block on each iteration will be `a` which points
to the string `"hello"`. This is used by `map` to determine transformation.
`line 3` will return a new array with a value of ["hello", "hello", "hello"].

```ruby
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

new_array = arr.map do |n|
  n > 1
  puts n
end
p new_array
```

On `line 1` the local variable `arr` is intialized to an array object.
On `line 3` the local variable `new_array` is initialized to the retun value
of invoking the `map` method on `arr`. On `line 5` the `puts` method is invoked
and passed the local variable `n` as an argument which will output the current element
on each iteration.  Because `puts` always returns a value of `nil`, the return value of the
block will evaluate as "falsey" on each iteration which `map` will used to determine transformation.
On `line 7` the `p` method is invoked and passed `new_array` as an argument which will output and return
the new transformed array `[nil, nil, nil nil nil nil nil nil nil]
```ruby
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

new_array = arr.map do |n|
  n > 1
end
p new_array

```
On `line 1` the local variable `arr` is initialized to an array object.
On `line 3` the local variable `new_array` is intiialized to the return value
of invoking the `map` method on `arr`.  On each iteration the code on `line 4`
will determine if the current element is greater than 1.  THis will return a boolean
value which will be used by `map` for transformation.  On `line 6` the `p` mehtod is
invoked and passed `new_array` as an argument which will be the new transformed array object
`[false, true, true, true, true, true, true, true, true, true]`.
```ruby
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

incremented = arr.map do |n|
            n + 1
            end
p incremented
```

On `line 1` the local variable `arr` is initialized to an array object.
On `line 3` the loccal variable `incremented` is initialized to the retun value
of invoking the `map` method on `arr`. The code inside the block will be ran once
for each element in the original collection, incrementing each element by one and creating
a new array object with a value of `[2,3,4,5,6,7,8,9,10,11]` which is the output and return value
of invoking the `p` method and passing `incremented` as an argument on `line 6`.

```ruby
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

arr.each { |n| puts n }
```

On `line 1` the local variable `arr` is initialized to the array `[1,2,3,4,5,6,7,8,9,10]`.
On `line 3` the `each` method is invoked on `arr` and passed a block.  Inside the block,
the `puts` method is invoked on the local variable `n` which will output each element
from `arr`
1
2
3
4
5
6
7
8
9
10
The original collection is returned by the `each` method.

```ruby
words = %w(jump trip laugh run talk)

new_array = words.map do |word|
  word.start_with?("t")
end

p new_array
```

On `line 1` the local variable `words` is initialized to the array `["jump", "trip", "laugh", "run", "talk"]`
On `line 3` the local variable `new_array` is initialized to the return value of invoking the `map` method on
`words`. On `line 4` the `start_with?` method is invoked on the local variable `word` and passed the string `"t"`
as an argument which will return a boolean value on each iteration. On `line 7` the `p` method is inovked and passed `new_array`
as an argument which will output and return `[false, true, false, false, true]`.  This demonstrates how the `map` method
uses the return value of the block to determine the transformation of each element.  The map method always returns a collection
the same size as the object it was called on.

```ruby
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

new_array = arr.select do |n|
  n + 1
  puts n
end
p new_array
```

On `line 1` the local variable `arr` is intialized to the array `[1,2,3,4,5,6,7,8,9,10]`.
On `line 3` the local variable `new_array` is initialized to the return value of invoking the `select`
method on `arr`. On `line 5` the `puts` method is invoked and passed the local variable `n` as an argument which
will output the current element on each iteration.
1
2
3
4
5
6
7
8
9
10

On each iteration the return value of the block will be evaluated as falsey due to `puts` always returning `nil`.
This means that no elements will be selected for the new array.  On `line 7` the `p` method is invoked and passed
`new_array` as an argument which will output and return an empty array `[]`.  This demonstrates how the `select`
method makes its selection based on the truthiness of the return value of the block

```ruby
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

new_array = arr.select do |n|
  n + 1
end
p new_array
```

On `line 1` the local variable `arr` is initialized to the array `[1,2,3,4,5,6,7,8,9,10]`.
On `line 3-5` the local variable `new_array` is initialized to the return value of invoking
the `map` method on `arr`. The return value of the do/end block on `lines 3-5` will evaluate
as truthy on each iteration, so every element from `arr` will be selected.
On `line 6` the `p` method is invoked and passed `new_array` as an argument which will output
the new array object assigned to `new_array` on `line 3` `[1,2,3,4,5,6,7,8,9,10].

```ruby
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

arr.select { |n| n.odd? }
```

On `line 1` the local variable `arr` is intiailized to the array `[1,2,3,4,5,6,7,8,9,10]`.
On `line 3` the `select` method is invoked on `arr` and passed a block. On each iteration
the block will invoke the `odd?` method on the current element, which will return a boolean value.
Elements that the block evaluates as truthy will be selected by the `select` method.  `select`
returns a new array object with a value of `[1,3,5,7,9]`. This demonstrates how the return value of
select is determined by the return value of the block.

```ruby
array = [1, 2, 3, 4, 5]

array.select do |num|
   puts num if num.odd?
end
```
On `line 1` the local variable `arr` is initialized to the array `[1,2,3,4,5]`.
On `line 3-5` the `select` method is invoked on `array` and passed a do/end block.
On `line 4`, the `odd?` method is invoked on `num` for each iteration and if this condition
evaluates as true, then the `puts` method is invoked and passed `num` as an argument. This code
will output `1`, `3`, and `5` on new lines but the return value of the block will evaluate as falsey
on each iteration because `puts` is the last line of code in the block being evaluated and always returns a value of `nil`.
The `select` method evaluates the truthiness of the block to determine which elements will be selected, so in this case
`select` will return a new empty array `[]`. This demonstrates the concept of puts vs return and how the select method
works.

```ruby
def add_name(arr, name)
  arr = arr << name
end

names = ['bob', 'kim']
add_name(names, 'jim')
puts names
```

On `line 5` the local variable `names` is initialized to the array `['bob', 'kim']`.
On `line 6` the `add_name` method is invoked and passed `names` and `'jim'` as arguments.
On `line 2` the local variable `arr` is reassigned to the return value of invoking the `<<`
method on `arr` and passing `name` as an argument. Since `<<` is a mutating method, The reassignment of `arr`
is still pointing to the same object as `names` which has been mutated to ['bob', 'kim', 'jim'].
On `line 7` the `puts` method is invoked and passed `names` as an argument which will output `bob`, `kim`
and `jim` on new lines, and return a value of `nil`.

```ruby
def add_name(arr, name)
  arr = arr + [name]
end

names = ['bob', 'kim']
add_name(names, 'jim')
puts names
```
On `line 5` the local variable `names` is initialized to the array `['bob', 'kim']
On `line 6` the `add_name` method is invoked and passed `names` and `'jim'` as arguments.
On `line 2` the local variable `arr` is reassigned to a new array object, leaving the array
referenced by `names` unchanged. On `line 7` the `puts` method is invoked and passed `names`
as an argument which will output `bob` and `kim` on new lines and return `nil`. THis demonstrates
the concept of variables as pointers.

```ruby
a = %w(a b c)
a[1] = '-'
p a
```

On `line 1` the local variable `a` is initialized to the array `["a", "b", "c"].
On `line 2` the element at the `1` index of `a` is set to `'-'`.
On `line 3` the `p` method is invoked and passed `a` as an argument which outputs
and returns ["a", "-"", "c"]. This demonstrates the concept of mutating methods.

```ruby
num = 3

num = 2 * num
```

On `line 1` the local variable `num` is intialized to the integer `3`.
On `line 3` `num` is reassigned to the value of `2` times `num` which is `6`.
This demonstrates the concept of variables as pointers.

```ruby
def a_method(string)
  string << ' world'
end

a = 'hello'
a_method(a)

p a
```

On `line 5` the local variable `a` is initialized to the string `'hello'`.
On `line 6` the `a_method` method is invoked and passed `a` as an argument.
On `line 2` the destructive method `<<` is invoked on the local variable `string`
and passed the string ` 'world'` as an argument. Since `<<` mutates the object it
was called on, and `string` points to the same object as `a`, `a` is now `'hello world'`
On `line 8` the `p` method is invoked and passed `a` as an argument which outputs and returns
`"hello world"`

```ruby
def fix(value)
 value[1] = 'x'
 value
end

s = 'abc'
t = fix(s)
```

On `line 6` the local variable `s` is initialized to the string `'abc'`.
On `line 7` the local variable `t` is initialized to the return value of
invoking the `fix` method and passing `s` as an argument. On `line 2` the
`1` index of `value` is set to `'x'`. `[]=` is a mutating method so `s` and
`value` are still pointing to the same string object with a new value of
`'axc'`, which is the return value of the method invocation on `line 7`
and assigned to `t`. `s` and `t` are `'axc'`.

```ruby
def fix(value)
  value = value.upcase!
  value.concat('!')
end

s = 'hello'
t = fix(s)
```

On `line 6` the local variable `s` is initialized to the string `'hello'`.
On `line 7` the local variable `t` is intiailized to the return value of
invoking the `fix` method and passing `s` as an argument. On `line 2` the local
variable `value` is reassigned to the return value of invoking the `upcase!` method
on `value`.  Since `upcase!` is a mutating method and no new object was created, `value` is basically being reassigned
to the same object it was already pointing to. So `value` and `s` are still pointing to the same string object, which now has a value
of `'HELLO'`. On `line 3` the `concat` method is invoked on `value` and passed `'!'`
as an argument.  The string object referenced by `value` and `s` is now `'HELLO!'`.
`s` and `t` both reference the same string object with a value of `'HELLO!'`.

```ruby
def fix(value)
  value << 'xyz'
  value = value.upcase
  value.concat('!')
end

s = 'hello'
t = fix(s)
```

On `line 7` the local variable `s` is initialized to the string `'hello'`.
On `line 8` the local variable `t` is intialized to the return value of invoking
the `fix` method and passing `s` as an argument.  On `line 2` the destructive `<<`
method is invoked on the local variable `value` and passed the string `'xyz'` as
an argument. At this point `value` and `s` are pointing to the same string object
with a value of `'helloxyz'`.  On `line 3` `value` is reassigned to the return value
of calling the `upcase` method on `value`, which is a new string object with a value
of `'HELLOXYZ'`. `value` and `s` are now pointing to two different string objects.
On `line 4` the `concat` method is invoked on `value` and passed `'!'` as an argument.
`value` is now `'HELLOXYZ!'`, which is what is returned by the method invocation on
`line 8` and assigned to `t`. `s` is `'helloxyz'` and `t` is `'HELLOXYZ!'`.

```ruby
def fix(value)
  value = value.upcase
  value.concat('!')
end

s = 'hello'
t = fix(s)
```

On `line 6` the local variable `s` is initialized to the string `'hello'`.  On `line 7`
the local variable `t` is initialized to the return value of invoking the `fix` method
and passing `s` as an argument. On `line 2` the local variable `value` is reassigned to the
return value of invoking the `upcase` method on `value`, which is a new string object. `value`
and `s` are now pointing to two different string objects.  On `line 3` the `concat` method is
invoked on `value` and passed `'!'` as an argument. `value` now references a string object with
a value of `'HELLO!'`, which is what the method invocation on `line 7` returns. Because of the
non-mutating reassignment on `line 2`, the object `s` points to remains unchanged and has a
value of `'hello'`. `t` is `'HELLO!'`.

```ruby
def fix(value)
  value.upcase!
  value.concat('!')
  value
end

s = 'hello'
t = fix(s)
```

On `line 7` the local variable `s` is initialized to the string `'hello'`.
On `line 8` the local variable t is initialized to the return value of
invoking the `fix` method and passing `s` as an argument.  On `line 2` the `upcase!` method
is called on the local variable `value` which is pointing to the same string object as `s`.
`upcase!` is a destructive method so `s` and `value` are now `'HELLO'`.  On `line 3` the `concat`
method is called on `value` and passed `!` as an argument.  This is also a destructive method so
`s` and `value` are now `'HELLO!'` which is what is explicitly returned on `line 4`
`s` and `t` both point to the same string object with a value of `'HELLO!'`.  This demonstrates
the concept of pass by reference, mutating methods, and variables as pointers.

```ruby
arr1 = ["a", "b", "c"]
arr2 = arr1.dup
arr2.map! do |char|
  char.upcase
end

puts arr1
puts arr2
```

On `line 1` the local variable `arr1` is initialized to the array `["a", "b", "c"]`.
On `line 2` the local variable `arr2` is initialized to the return value of calling
the `dup` method on `arr1` which creates a duplicate new object.  On `line 3` the `map!`
method is invoked on `arr2` and each element is transformed based on the return value of the block.
On `line 7` the `puts` method is invoked and passed `arr1` as an argument. `arr1` remains unchanged
because `arr2` was initialized to a copy of `arr1`, so any changes made to `arr2` will only affect
the object `arr2` is pointing to.  This demonstrates the concept of variables as pointers.
On `line 8` the `puts` method is invoked and passed `arr2` as an argument which will output `A B C` with each letter being on a new line.

```ruby
a = [1, 3]
b = [2]
arr = [a, b]
arr

a[1] = 5
arr
```

On `line 1` the local variable `a` is initialized to the array `[1, 3]`
On `line 2` the local variable `b` is initialized to the array `[2]`
On `line 3` the local variable `arr` is initialized to the array `[a, b]`
At this point `arr` is [[1, 3], [2]]
On `line 6` the element at the 1 index of `a` is set to `5`.
Since the first element in `arr` is still pointing to the object referenced by `a`,
using the destructive element assignment method on `a` will affect the object `arr` is pointing to.
This demonstrates the concept of variables as pointers and destructive methods.
`arr` is now [[1, 5], [2]]

```ruby
def cap(str)
  str.capitalize!
end

name = "jim"
cap(name)
puts name
```

On `line 5` the local variable `name` is initialized to the string `"jim"`.
On `line 6` the `cap` method is invoked and passed `name` as an argument.
On `line 2` the `capitalize!` method is called on the local variable `str` (which
points to the same object that `name` is pointing to).  `capitalize!` is a destructive
method so the original object will be mutated.  This demonstrates the concept of mutating
methods and pass by reference.  On `line 7` the `puts` method is invoekd and passed `name`
as an argument which will output `Jim` and return `nil`.

```ruby
def change_name(name)
  name = 'bob'      # does this reassignment change the object outside the method?
end

name = 'jim'
change_name(name)
puts name
```

On `line 5` the local variable `name` is initalized to the string `'jim'`. On `line 6`
the `change_name` method is invoked and passed `name` as an argument.  On `line 2` the
local variable `name` is reassigned to the string `'bob'`.  Since reassignment is non-mutuating,
the original object referenced by name will be unchanged. This demosntrates
the concept of non-mutating methods and pass by value. On `line 7` the `puts` method is invoked
and passed `name` as an argument which will output `jim` and return `nil`.

```ruby
def increment(x)
  x << 'b'
end

y = 'a'
increment(y)

puts y
```

On `line 5` the local variable `y` is initialized to the string `'a'`.  On `line 6` the
`increment` method is invoked and passed `y` as an argument. On `line 2` the `<<` method is
invoked on the local variable `x` and passed `'b'` as an argument.  Since `x` and `y` are both pointing
to the same object, and `<<` is a destructive method, the original object that `y` is poinging to will be mutated. This demonstrates
the concept of pass by reference and variables as pointers.
On `line 8` the `puts` method is invoked and passed `y` as an argument which will output `'ab'` and return a value of `nil`.

```ruby
def plus(x, y)
  x = x + y
end
a = 3
b = plus(a,2)
puts a
puts b
```

On `line 4` the local variable `a` is initialized to the integer `3`. On `line 5`
the local variable `b` is initialized to the return value of invoking the `plus` method
and passing `a` and `2` as arguments, which is `5`.  On `line 6` the `puts` method is invoked
and passed `a` as an argument which will output `3` and return `nil`.  On `line 7` the `puts`
method is invoked and passed `b` as an argument which will output `5`.  THis demonstrates the concept
of method invvocation and implicit return value.

```ruby
def test(str)
  str += '!'
  str.downcase!
end
test_str = 'Written Assessment'
test(test_str)
puts test_str
```

On `line 5` the local variable `test_str` is initialized to the string `'Written Assessment'`.
On `line 6` the `test` method is invoked and passed `test_str` as an argument.  On `line 2` the local
variable `str` is reassigned to a new string object `'Written Assessment!'`. On `line 3` the `downcase!`
method is called on `str`.  The `test` method returns a value of `'written assessment!'`.  On `line 7`
the `puts` method is invoked and passed `test_str` as an argument which will output `'Written Assessment'`.
The string object that `test_str` points to is unchanged because `str` was reassigned to a new string object on `line 2`
This demonstrates the concept of mutating vs non mutating methods, variables as pointers, and pass by value.

```ruby
a = 5.2
b = 7.3
a = b
b += 1.1
what is a and b and why?
```
On `line 1` the local variable `a` is intialized to the float `5.2`. On `line 2`
the local variable `b` is intialized to the float `7.3`. On `line 3` `a` is reassigned to `b`
so `a` and `b` are now both `7.3`.  On `line 4` `b` is reassigned to the value of `b` plus `1.1`.
Since reassignment is non-mutating, `a` is still `7.3` and `b` is now `8.4`

```ruby
def test(b)
  b.map { |letter| "I like the letter: #{letter}" }
end
a = ['a', 'b', 'c']
test(a)
```

On `line 4` the local variable `a` is initialized to the array `['a', 'b', 'c']`
On `line 5` the `test` method is invoked and passed `a` as an argument.  On `line 2`
the `map` method is called on the local variable `b` which returns a new transformed array
`["I like the letter: a", "I like the letter: b", "I like the letter: c"]
`a` is left unchanged because the code in the `test` method is non-mutating.  If the destructive method
`map!` was used, then the return value of the `test` method would be reflected in the object `a` is pointing to.

```ruby
a = [1,2,3,3]
b = a
c = a.uniq
what are a,b,c? what if hte last line was c = a.uniq!?
```

On `line 1` the local variable `a` is initialized to an array object `[1,2,3,3]`.
On `line 2` the local variable `b` is initialized to `a`. `a` and `b` are now both
pointing to the same array object.  On `line 3` the local variable `c` is initialized
to the return value of invoking the `uniq` method on `a` which is `[1,2,3].
`a` and `b` are [1,2,3,3] and `c` is `[1,2,3]`.  If the destructive method `uniq!`
was invoked, the original object would be mutated and `a` `b` and `c` would all
be `[1,2,3]`.

```ruby
a = "hi there"
b = a
a << ", Bob"
what are a and b?
```

On `line 1` the local variable `a` is initialized to the string `"hi there"`.
On `line 2` the local variable `b` is initialized to `a`.  On `line 3` the `<<`
method is invoked on `a` and passed the string `", Bob"` as an argument. `<<`
is a destructive method meaning it mutates the object that it was called on, so
`a` and `b` are pointing to the same string object with a value of `"hi there, Bob"`

```ruby
a = "hi there"
b = a
a = "not here"

what are a and b?
```

On `line 1` the local variable `a` is initialized to the string `"hi there"`.
On `line 2` the local variable `b` is initialized to `a`. `a` and `b` are now
both pointing to the same string object `"hi there"`. On `line 3` `a` is reassigned
to a new string object `"not here"`. `a` is now `"not here"` and `b` is still `"hi there"`
Even though `a` was reassigned, `b` is still pointing to the object `a` was originally pointing to.
THis demonstrates the concept of variables as pointers.

```ruby
animal = "dog"
loop do |animal|
  animal = "cat"
  break
end
puts animal
```

On `line 1` the local variable `animal` is initialized to the string `"dog"`.
On `lines 2-5` the `loop` method is invoked and passed a do/end block with one
parameter named `animal`.  On `line 3` the inner scoped variable `animal` is
assigned to the string `"cat"`. When a block parameter shares the same name as a variable
in the outer scope, the parameter takes precedence, leaving the variable in the outer scope unchanged,
so on `line 6` when the `puts` method is invoked and passed `animal` as an argument, the output will be
`dog`.  This demonstrates variable shadowing.

```ruby
n = 10
1.times do |n|
  n = 11
end
puts n
```

On `line 1` the local variable `n` is initialized to the integer `10`
On `lines 2-4` a do/end block is defined with one parameter named `n`
On `line 3` a new local variable `n` is initialized to the integer `11`.
The code on `line 3` will not affect the `n` variable in the outerscope because
when a block parameter has the same name, the inner scoped variable takes precedence. On `line 5`
the `puts` method is invoked and passed `n` as an argument which will output `10`
and return nil.  This demonstrates the concept of variable shadowing.

```ruby
a = 4
b = 2
2.times do |a|
  a = 5
  puts a
end
puts a
puts b
```

On `line 1` the local variable `a` is initialized to the integer `4`.
On `line 2` the local variable `b` is initialized to the integer `2`.  On
`lines 3-6` a do/end block is defined with one parameter named `a`.  On `line 4`
the local variable `a` is initialized to `5` and on `line 5` the `puts` method is invoked and passed `a`
as an argument. This will output:
5
5
On `line 7` the `puts` method is invoked and passed `a` as an argument.  This will output
`4` because when a parameter has the same name as a variable in an outer scope, the code
in the block will only affect the variable scoped to the block, leaving the variable in the outer scope unchanged.
On `line 8` the `puts` method is invoked and passed `b` as an argument which will output `2` and return nil.

```ruby
animal = "dog"

loop do |_|
  animal = "cat"
  var = "ball"
  break
end

puts animal
puts var
```

On `line 1` the loccal variable `animal` is initialized to the string `"dog"`
Within the do/end block on `lines 3-7`, `animal` is reassigned to the string `"cat"` on
`line 4` and the local variable `var` is initialized to the string `"ball"` on `line 5`.
On `line 9` the `puts` method is invoked and passed `animal` as an argument which will output
`cat` and return nil.  On `line 10` the `puts` method is invoked and passed `var` as an argument, this
will result in an error because `var` was initialized within the inner scope of the block and is
not available for use in an outer scope. `animal` is able to be reassigned from within the block because
it was initialized in an outer scope.  THis demonstrates teh concept of local variable scope.

```ruby
a = 'Bob'

5.times do |x|
  a = 'Bill'
end

p a
```

On `line 1` the local variable `a` is initialized to the string `'Bob'`.
On `line 4`, inside the do/end block, `a` is reassigned to the string `'Bill'`.
On `line 7` the `p` method is invoked and passed `a` as an argument which will
output and return the string `"Bill"`.  Even though `a` was initialized in an outer
scope, it is accessible from within the block which demonstrates the concept of
local variable scope.

```ruby
arr = [1, 2, 3, 4]
counter = 0
sum = 0

loop do
  sum += arr[counter]
  counter += 1
  break if counter == arr.size
end

puts "Your total is #{sum}"
```

On `line 2` the local variable `counter` is initailized to the integer `0`.
On `line 3` the `sum` variable is initialized to the integer `0`. On `lines 5-9`
the `loop` method is invoked and passed a do/end block.  On `line 6` `sum` is
reassigned to the value of `sum` plus the value of the element at the 0 index of the `arr` variable.
The loop will iterate until `counter` is equal to the size of `arr` which is `4`.
On `line 11` the `puts` method is invoked and passed a string as an argument. The output
is `Your total is 10`.  `sum` is accessible and able to be reassigned within the inner scope of the
block which demonstrates the concept of local variable scope.

```ruby
def greetings(str)
  puts str
  puts "Goodbye"
end

word = "Hello"
greetings(word)
```

On `line 6` the local variable `word` is initialized to the string `"Hello"`.
On `line 7` the `greetings` method is invoked and passed `word` as an argument.
On `line 2` the `puts` method is invoked and passed `str` as an argument. `str`
is pointing to the same object referenced by `word` so the output will be `Hello`
On `line 3` the `puts` method is invoked and passed the string `"Goodbye"` as an
argument which will output `GoodBye`.  The method invocation will return a value
of nil.  This demonstrates the concept of variables as pointers and method invocation.

```ruby
def example(str)
  i = 3
  loop do
    puts str
    i -= 1
    break if i == 0
  end
end

example('hello')
```

On `line 10` the `example` method is invoked and passed the string `'hello'`
as an argument.  On `line 2` the local variable `i` is initialized ot the integer `3`.
On `lines 3-7` the `loop` method is invoked and passed a do/end block that will decrement
the value of `i` on each iteration until it is equal to `0`.  On `line 4` the `puts` method
is invoked and passed `str` as an argument which will output `hello`.  The loop will iterate 3
times resulting in an output of:
hello
hello
hello
and returning a value of nil.
This demonstrates the concept of method invocation and local variable scope because `i` was accessible
from within the inner scope of the block.

```ruby
a = 4
b = 2

loop do
  c = 3
  a = c
  break
end

puts a
puts b
```

On `line 1` the local variable `a` is initlaized to the integer `4`. On `line 2`
the local variable `b` is initialized to the integer `2`.  On `line 5`, within the
do/end block, the local variable `c` is initialized to the integer `3` and on `line 6`
`a` is reassigned to `c`.  On `line 10` the `puts` method is invoked and passed `a` as
an argument which will output `3` and return a value of nil.  On `line 11` the `puts`
method is invoked and passed `b` as an argument which will output `2` and return
a value of nil. `a` is accessible and able to be reassigned from within the block which
demonstrates the concept of local variable scope when it comes to blocks.

```ruby
a = 4

loop do
  a = 5
  b = 3

  break
end

puts a
puts b
```

On `line 1` the local variable `a` is initialized to the integer `4`.  Inside the
do/end block, on `line 4` `a` is reassigned to `5` and on `line 5` the local variable `b`
is initialized to the integer `3`.  On `line 10` the `puts` method is invoked and passed `a`
as an argument which will output `5` and return a value of nil.  On `line 11` the `puts` method
is invoked and passed `b` as an argument which will result in an error. `a` was able to be
reassigned from within the block because the block can access variables that were initialized
in an outer scope, but variables initialized within blocks are not accessible by an outer scope
which is why `line 11` results in an error. This demonstrates the concept of local variable scope.

```ruby
a = “Hello”
b = a
a = “Goodbye”

puts a
puts b
```

On `line 1` the local variable `a` is initialized to the string `"Hello"`. On `line 2`
the local variable `b` is initialized to `a`. `a` and `b` are now both pointing to the
same string object.  On `line 3` `a` is reassigned to a new string object with a value
of `"Goodbye"`.  On `line 5` the `puts` method is invoked and passed `a` as an argument
which will output `"GoodBye"` and return a value of nil.  On `line 6` the `puts` method is
invoked and passed `b` as an argument which will output `"Hello"` and return a value of nil.
This demonstrates the concept of variables as pointers because even though `a` was reassigned,
`b` is still pointing to the original object `a` was assigned to.
