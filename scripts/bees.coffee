module.exports = (robot) ->

  bees = ["https://media.giphy.com/media/11eiwjXGQnFzUY/giphy.gif", "https://media.giphy.com/media/Sc3uuIjOOlljq/giphy.gif", "https://media.giphy.com/media/FphE0L24UycIU/giphy.gif", "https://media.giphy.com/media/aGOOLIGz5EzOE/giphy.gif"]

  robot.hear /bee/, (res) ->
    random = Math.floor((Math.random() * bees.length) + 0);
    res.send bees[random]

  robot.hear /bead/, (res) ->
    random = Math.floor((Math.random() * bees.length) + 0);
    res.send bees[random]