require File.join(File.dirname(__FILE__), 'player')
require File.join(File.dirname(__FILE__), 'die')

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
			die = Die.new
			case die.roll
			when 1..2
				p.blam
			when 3..4
				puts "#{p.name} was skipped."
			else
				p.w00t
			end
			puts p
		end		
	end
end