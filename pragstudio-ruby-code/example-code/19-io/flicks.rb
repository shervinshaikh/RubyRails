require_relative 'movie'
require_relative 'playlist'

playlist = Playlist.new("Kermit")
playlist.load(ARGV.shift || "movies.csv")

# or add movies programmatically...
# movie1 = Movie.new("Goonies", 10)
# movie2 = Movie.new("Ghostbusters", 5)
# movie3 = Movie.new("Goldfinger")
# playlist.add_movie(movie1)
# playlist.add_movie(movie2)
# playlist.add_movie(movie3)
# playlist.play(3)
# playlist.print_stats

loop do
  puts "\nHow many viewings? ('quit' to exit)"
  answer = gets.chomp.downcase
  case answer
  when /^\d+$/
    playlist.play(answer.to_i)
  when 'quit', 'exit'
    playlist.print_stats
    break
  else
    puts "Please enter a number or 'quit'"
  end
end

playlist.save