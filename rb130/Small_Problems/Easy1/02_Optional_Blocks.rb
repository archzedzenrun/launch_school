# def compute
#   block_given? ? yield : 'Does not compute.'
# end

# p compute { 5 + 3 } == 8
# p compute { 'a' + 'b' } == 'ab'
# p compute == 'Does not compute.'

# Further exploration:

def compute(arg)
  block_given? ? yield(arg) : 'Does not compute.'
end

p compute(3) { |num| num + 3 } == 6
p compute('hello') { |str| str + ' world' } == 'hello world'
p compute(3) == 'Does not compute.'