module.exports = (robot) ->

robot.respond /spotify (.*)/i, (res) ->
    artistName = res.match[1]
    if artistName is "Hoobastank"
      res.reply "Sorry, I only search for music."
    else
      res.reply "Finding #{artistName} on Spotify..."