exports.calculate = (game) ->
  frames(parse game).reduce sum, 0

sum = (x, y) -> (x + y)

parse = (game) ->
  for s, i in game
    switch s
      when '-' then 0
      when 'X' then 10
      when '/' then 10 - game[i - 1]
      else parseInt s

frames = (throws) ->
  fs = []
  while fs.length < 10

    # Strike
    if throws[0] == 10
      fs.push throws.slice(0, 3).reduce sum, 0
      throws = throws.slice 1

    # Spare
    else if throws[0] + throws[1] == 10
      fs.push throws.slice(0, 3).reduce sum, 0
      throws = throws.slice 2

    else
      fs.push throws.slice(0, 2).reduce sum, 0
      throws = throws.slice 2
  fs