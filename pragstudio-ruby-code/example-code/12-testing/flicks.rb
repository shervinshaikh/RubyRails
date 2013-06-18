require_relative 'movie'
require_relative 'playlist'

movie1 = Movie.new("Goonies", 10)
movie2 = Movie.new("Ghostbusters", 5)
movie3 = Movie.new("Goldfinger")

playlist = Playlist.new("Kermit")
playlist.add_movie(movie1)
playlist.add_movie(movie2)
playlist.add_movie(movie3)
playlist.play
