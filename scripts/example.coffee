module.exports = (robot) ->

  robot.hear /spotify (.*)/i, (response) ->
    artistName = response.match[1].toLowerCase()
    if artistName is "hoobastank"
      response.send "Sorry, I only search for music."
    else
      searchName = artistName.replace(" ", "+")
      robot.http("https://api.spotify.com/v1/search?q=#{searchName}&type=artist")
        .get() (err, res, body) ->
          if err
            response.send "Oh noes! #{err}"
            return
          data = JSON.parse body
          id = data.artists.items[0].id
          robot.http("https://api.spotify.com/v1/artists/#{id}/top-tracks?country=US")
            .get() (err, res, body) ->
              if err
                response.send "Oh noes! #{err}"
                return
              data = JSON.parse body
              response.send "#{data.tracks[0].external_urls.spotify}"