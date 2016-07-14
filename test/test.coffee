Helper = require('hubot-test-helper')
chai = require 'chai'
expect = chai.expect
helper = new Helper('../scripts/bees.coffee')

class MockResponse extends Helper.Response
  random: (bees) ->
    "https://media.giphy.com/media/11eiwjXGQnFzUY/giphy.gif"


describe 'an obscure Arrested Development joke', ->
  beforeEach ->
    @room = helper.createRoom({'response': MockResponse})

  afterEach ->
    @room.destroy()

  context 'it is watching for bees', ->
    beforeEach ->
      @room.user.say 'lucas', 'isnt that the bees knees?'

    it 'should respond with an image', ->
      expect(@room.messages[1]).to.eql ['hubot', 'https://media.giphy.com/media/11eiwjXGQnFzUY/giphy.gif']

  context 'it is watching for beads', ->
    beforeEach ->
      @room.user.say 'lucas', 'i got some new beads today.'

    it 'should respond with an image', ->
      expect(@room.messages[1]).to.eql ['hubot', 'https://media.giphy.com/media/11eiwjXGQnFzUY/giphy.gif']