exports.calculate = (score) ->
  frames = for s, i in score when s == 'X' or i % 2 == 0
    [s, score[i+1], score[i+2]]

  frames.slice(0, 10).reduce scoreFrame, 0

scoreFrame = (sum, frame) ->
  frame = for f, i in frame
    switch f
      when '-' then 0
      when 'X' then 10
      when '/' then 10 - frame[i - 1]
      else parseInt f

  if frame[0] == 0 || frame[1] == 0
    sum + frame[0] + frame[1]
  else
    sum + frame[0] + frame[1] + frame[2]