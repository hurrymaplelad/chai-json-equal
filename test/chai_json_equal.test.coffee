chai = require 'chai'
chaiJsonEqual = require '..'
chaiRoughly = require 'chai-roughly'

chai.should()
chai.use chaiRoughly
chai.use chaiJsonEqual

describe 'chai-json-equal', ->
  describe 'given objects that arent equal but are represented the same in json', ->
    it 'passes', ->
      "ship".should.jsonEqual toJSON: -> "ship"

  describe 'given objects with different json representations', ->
    it 'fails', ->
      "ship".should.not.jsonEqual "barge"

  describe 'chained with contain', ->
    it 'transforms compared values to json', ->
      ["ship"].should.not.contain toJSON: -> "ship"
      ["ship"].should.jsonEqual.contain toJSON: -> "ship"

  describe 'chained with members', ->
    it 'transforms compared values to json', ->
      ["ship"].should.not.have.members [toJSON: -> "ship"]
      ["ship"].should.have.jsonEqual.members [toJSON: -> "ship"]

  describe 'chained with roughly', ->
    describe 'given objects with numeric values that are roughly equal', ->
      it 'passes', ->
        [shipLengthMeters: 9.9999999999999].should.roughly.deep.equal [shipLengthMeters: 10]
        [toJSON: -> [shipLengthMeters: 9.9999999999999]].should.jsonEqual.roughly [shipLengthMeters: 10]
        [shipLengthMeters: 10].should.jsonEqual.roughly [toJSON: -> [shipLengthMeters: 10.0000000000002]]
