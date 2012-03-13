exports.calculate = (score) ->
  score = for s, i in score
    switch s
      when '-' then 0
      when 'X' then 10
      when '/' then 10 - score[i - 1]
      else parseInt s

  frames = []
  while frames.length < 10

    # Strike
    if score[0] == 10
      frames.push score[0] + score[1] + score[2]
      score = score.slice 1

    # Spare
    else if score[0] + score[1] == 10
      frames.push score[0] + score[1] + score[2]
      score = score.slice 2

    else
      frames.push score[0] + score[1]
      score = score.slice 2

  frames.reduce ((sum, frame) -> sum + frame), 0
