require File.join(File.dirname(__FILE__), 'player')
require File.join(File.dirname(__FILE__), 'game_turn')
require File.join(File.dirname(__FILE__), 'treasure_trove')

class Game
	attr_reader :name
	def initialize(name)
		@name = name
		@players = []
	end

	def add_player(player)
		@players << player
	end

	def play(rounds)
		puts "There are #{@players.size} players in #{@name}:"
		@players.each do |p|
			puts p
		end

		1.upto(rounds) do |round|
			puts "\nRound #{round}:"
			@players.each do |p|
				GameTurn.take_turn(p)
				puts p
			end		
		end

		treasures = TreasureTrove::TREASURES
		puts "\nThere are #{treasures.size} treasures to be found:"
		treasures.each do |t|
			puts "A #{t.name} is worth #{t.points} points"
		end
	end

	def print_name_and_health(game)
		game.each do |p|
			puts "#{p.name} (#{p.health})"
		end
	end

	def print_stats
		puts "\n#{@name} Statisitics:"
		strong, wimpy = @players.partition { |p| p.strong? }

		puts "\n#{strong.size} strong players:"
		print_name_and_health(strong)

		puts "\n#{wimpy.size} wimpy players:"
		print_name_and_health(wimpy)

		puts "\n#{@name} High Scores:"
		@players.sort.each do |p|
			format_name = p.name.ljust(20, '.')
			puts "#{format_name} #{p.score}"
		end
	end
end