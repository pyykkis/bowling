exports.calculate = (game) ->
  frames(parse game)[0..9].reduce sum

sum = (x, y) -> (x + y)

parse = (game) ->
  for char, i in game
    switch char
      when '-' then 0
      when 'X' then 10
      when '/' then 10 - game[i - 1]
      else parseInt char

frames = (throws) ->
  return [] unless throws.length

  if throws[0] == 10 # Strike
    [throws[0..2].reduce sum].concat frames throws[1...]

  else if throws[0..1].reduce(sum) == 10 # Spare
    [throws[0..2].reduce sum].concat frames throws[2...]

  else
    [throws[0..1].reduce sum].concat frames throws[2...]
