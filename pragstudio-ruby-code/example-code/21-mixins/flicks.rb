require_relative 'movie'
require_relative 'playlist'

playlist = Playlist.new("Kermit")
playlist.load(ARGV.shift || "movies.csv")

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
