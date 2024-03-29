def neutralize(sentence)
  words = sentence.split(' ')
  words.reject! do |word| # Chaned to reject! so that the words variable isnt being mutated during iteration.
    word if negative?(word)
  end

  words.join(' ')
end

def negative?(word)
  [ 'dull',
    'boring',
    'annoying',
    'chaotic'
  ].include?(word)
end

puts neutralize('These dull boring cards are part of a chaotic board game.')
# Expected: These cards are part of a board game.
# Actual: These boring cards are part of a board game.