class Die
	attr_reader :number

	def initialize
		roll
	end

	def roll
		@number = rand(6) + 1
	end
end

if __FILE__ == $0
	die = Die.new
	puts die.roll
	puts die.roll
	puts die.roll
end