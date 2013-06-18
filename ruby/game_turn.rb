require File.join(File.dirname(__FILE__), 'player')
require File.join(File.dirname(__FILE__), 'die')

module GameTurn
	def self.take_turn(p)
		die = Die.new
		case die.roll
		when 1..2
			p.blam
		when 3..4
			puts "#{p.name} was skipped."
		else
			p.w00t
		end
	end
end