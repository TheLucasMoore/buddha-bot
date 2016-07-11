module.exports = (robot) ->

  robot.hear /spotify (.*)/i, (response) ->
    artistName = response.match[1].toLowerCase()
    if artistName is "hoobastank"
      response.send "Sorry, I only search for music."
    else
      response.send "Finding #{artistName} on Spotify..."
      searchName = artistName.replace(" ", "+")
      robot.http("https://api.spotify.com/v1/search?q=#{searchName}&type=artist")
        .get() (err, res, body) ->
          if err
            response.send "Encountered an error :( #{err}"
            return
          data = JSON.parse body
          response.send "#{data.artists.items[0].id}"