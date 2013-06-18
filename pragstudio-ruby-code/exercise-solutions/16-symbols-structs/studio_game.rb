require_relative 'player'
require_relative 'game'

player1 = Player.new("moe")
player2 = Player.new("larry", 60)
player3 = Player.new("curly", 125)

knuckleheads = Game.new("Knuckleheads")
knuckleheads.add_player(player3)
knuckleheads.add_player(player2)
knuckleheads.add_player(player1)
knuckleheads.play(3)
knuckleheads.print_stats

