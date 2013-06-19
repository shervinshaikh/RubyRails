require File.join(File.dirname(__FILE__), 'auditable')

module StudioGame
	class Die
		include Auditable

		attr_reader :number

		def initialize
			roll
		end

		def roll
			@number = rand(6) + 1
			audit
			@number
		end
	end
end

if __FILE__ == $0
	die = Die.new
	puts die.roll
	puts die.roll
	puts die.roll
end