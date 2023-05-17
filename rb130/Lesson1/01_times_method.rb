def times(num)
  count = 0
  until count > num
    yield(count)
    count += 1
  end
  num
end

times(5) do |num|
  puts num
end