exports.calculate = (score) ->
  frames = for s, i in score when i % 2 == 0
    [s, score[i+1], score[i+2]]

  frames.slice(0, 10).reduce scoreFrame, 0

scoreFrame = (sum, frame) ->
  return sum + 0                      if frame[0] == '-' and frame[1] == '-'
  return sum + parseInt frame[0]      if frame[1] == '-'
  return sum + 10 + parseInt frame[2] if frame[1] == '/'