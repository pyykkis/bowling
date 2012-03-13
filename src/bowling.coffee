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

  if strike(rolls)
    [rolls[0..2]].concat frames rolls[1...]

  else if spare(rolls)
    [rolls[0..2]].concat frames rolls[2...]

  else
    [rolls[0..1]].concat frames rolls[2...]

strike = (rolls) -> rolls[0] == 10
spare  = (rolls) -> rolls[0] + rolls[1] == 10
