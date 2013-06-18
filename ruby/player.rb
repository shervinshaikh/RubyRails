class Player
	attr_accessor :name, :health

	def initialize(name, health=100)
		@name = name.capitalize
		@health = health
	end

	def w00t
		@health += 15
		puts "#{@name} got w00ted!"
	end

	def blam
		@health -= 10
		puts "#{@name} got blammed!"
	end

	def score
		@health + @name.length
	end

	def name=(new_name)
		@name = new_name.capitalize
	end

	def to_s
		"I'm #{@name.capitalize} with a health of #{@health} and a score of #{score}."
	end

	def strong?
		@health > 100
	end

	def <=>(other_player)
		other_player.score <=> score
	end
end

if __FILE__ == $0
	player = Player.new("moe")
	puts player.name
	puts player.health
	player.w00t
	puts player.health
	player.blam
	puts player.health
end