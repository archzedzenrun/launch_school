def count(arr)
  count = 0
  arr.each { |val| count += 1 if yield(val) }
  count
end

p count([1,2,3,4,5]) { |value| value.odd? } == 3
p count([1,2,3,4,5]) { |value| value % 3 == 1 } == 2
p count([1,2,3,4,5]) { |value| true } == 5
p count([1,2,3,4,5]) { |value| false } == 0
p count([]) { |value| value.even? } == 0
p count(%w(Four score and seven)) { |value| value.size == 5 } == 2

# Further Exploration:

def count(arr)
  arr.select { |val| yield(val) }.size
end