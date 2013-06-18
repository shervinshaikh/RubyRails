require File.join(File.dirname(__FILE__), 'player')
require File.join(File.dirname(__FILE__), 'game_turn')

class Game
	attr_reader :name
	def initialize(name)
		@name = name
		@players = []
	end

	def add_player(player)
		@players << player
	end

	def play
		puts "There are #{@players.size} players in #{@name}:"
		@players.each do |p|
			puts p
		end

		@players.each do |p|
			GameTurn.take_turn(p)
			puts p
		end		
	end
end