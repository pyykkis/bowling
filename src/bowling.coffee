exports.calculate = (score) ->
  (parseInt s for s in score when s != '-').reduce ((x1, x2) -> x1 + x2), 0