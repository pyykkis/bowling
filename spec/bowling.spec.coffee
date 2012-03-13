should  = require "should"
bowling = require "../src/bowling"

describe "Bowling", ->
  it "should return 0 for all gutters", ->
    bowling.calculate("--------------------").should.equal 0

  it "should return ninety for ten nines and ten misses", ->
    bowling.calculate("9-9-9-9-9-9-9-9-9-9-").should.equal 90