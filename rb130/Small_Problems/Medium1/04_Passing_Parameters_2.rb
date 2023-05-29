def birds(arr)
  yield(arr)
end

arr = ['raven', 'finch', 'hawk', 'eagle']
birds(arr) { |_, _, *raptors| p raptors }# = birds[2] }