module.exports = (robot) ->

  bees = ["https://media.giphy.com/media/11eiwjXGQnFzUY/giphy.gif", "https://media.giphy.com/media/Sc3uuIjOOlljq/giphy.gif", "https://media.giphy.com/media/FphE0L24UycIU/giphy.gif", "https://media.giphy.com/media/aGOOLIGz5EzOE/giphy.gif"]

  robot.hear /bee/, (res) ->
    res.send res.random bees

  robot.hear /bead/, (res) ->
    res.send res.random bees