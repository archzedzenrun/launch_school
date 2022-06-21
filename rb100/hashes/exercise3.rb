hash = { name: "Bob", age: 25, height: "5'10", weight: 135 }

hash.each_key { |k| puts k }
hash.each_value { |v| puts v }
hash.each { |k, v| puts "#{k}: #{v}" }