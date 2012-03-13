should  = require "should"
bowling = require "../src/bowling"

describe "Bowling", ->
  it "should return 0 for all gutters", ->
    bowling.calculate("--------------------").should.equal 0

  it "should return ninety for ten nines and ten misses", ->
    bowling.calculate("9-9-9-9-9-9-9-9-9-9-").should.equal 90

  it "should return 150 for 10 pairs of 5 and spare, with a final 5", ->
    bowling.calculate("5/5/5/5/5/5/5/5/5/5/5").should.equal 150