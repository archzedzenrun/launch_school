def decrease(counter)
  counter - 1 # Removed reassignment, redundant. Method returns the value passed in minus 1.
end

counter = 10

counter.times do
  puts counter
  counter = decrease(counter) # Local variable counter must be reassigned to the new value of counter on each iteration.
end

puts 'LAUNCH!'