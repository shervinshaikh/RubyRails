require File.join(File.dirname(__FILE__), 'game') # require_relative 'game' ----> in ruby 1.9
require File.join(File.dirname(__FILE__), 'player')
require File.join(File.dirname(__FILE__), 'clumsy_player')
require File.join(File.dirname(__FILE__), 'berserk_player')

knuckleheads = Game.new("Knuckleheads")
knuckleheads.load_players(ARGV.shift || "players.csv")

klutz = ClumsyPlayer.new("klutz", 105)
knuckleheads.add_player(klutz)

berserker = BerserkPlayer.new("berserker", 50)
knuckleheads.add_player(berserker)

loop do
	puts "How many game rounds? ('quit' to exit)"
	answer = gets.chomp.downcase
	case answer
	when /^\d+$/
		knuckleheads.play(answer.to_i)
	when 'quit', 'exit'
		knuckleheads.print_stats
		break
	else
		puts "Please enter a number or 'quit'"
	end
end

knuckleheads.save_high_scores