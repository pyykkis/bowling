exports.calculate = (game) ->
  frames(parse game)[0..9].reduce((fs, f) -> fs.concat f).reduce (sum, r) -> (sum + r)

parse = (game) ->
  for char, i in game
    switch char
      when '-' then 0
      when 'X' then 10
      when '/' then 10 - game[i - 1]
      else parseInt char

frames = (rolls) ->
  return [] unless rolls.length

  if rolls[0] == 10 # Strike
    [rolls[0..2]].concat frames rolls[1...]

  else if rolls[0] + rolls[1]  == 10 # Spare
    [rolls[0..2]].concat frames rolls[2...]

  else
    [rolls[0..1]].concat frames rolls[2...]
