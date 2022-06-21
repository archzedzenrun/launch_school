a = ['white snow', 'winter wonderland', 'melting ice',
     'slippery sidewalk', 'salted roads', 'white trees']
array = a.map { |words| words.split }
array = array.flatten
p array