chai = require 'chai'
chaiJsonEqual = require '..'

chai.should()
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
