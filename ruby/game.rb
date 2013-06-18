require File.join(File.dirname(__FILE__), 'player')
require File.join(File.dirname(__FILE__), 'game_turn')
require File.join(File.dirname(__FILE__), 'treasure_trove')
require 'csv'

class Game
	attr_reader :name
	def initialize(name)
		@name = name
		@players = []
	end

	def load_players(file)
		# File.readlines(file).each do |line|
		# 	add_player(Player.from_csv(line))
		# end
		CSV.foreach(from_file) do |row|
			player = Player.new(row[0], row[1].to_i)
			add_player(player)
		end
	end

	def save_high_scores(to_file="high_scores.txt")

		File.open(to_file, "w") do |f|
			f.puts "#{@name} High Scores:"
			@players.each do |p|
				f.puts format_name(p)
			end
		end
	end

	def format_name(player)
		name = player.name.ljust(20, '.')
		"#{name} #{player.score}"
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

	def total_points
		@players.reduce(0) { |sum, p| sum += p.points }
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
			puts format_name(p)
		end

		@players.each do |p|
			puts "\n#{p.name}'s point totals:"
			p.each_found_treasure do |t|
				puts "#{t.points} total #{t.name} points"
			end
			puts "#{p.points} grand total points"
		end

		puts "\n#{total_points} total points from treasures found"
	end
end