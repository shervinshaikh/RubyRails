require File.join(File.dirname(__FILE__), 'game') # require_relative 'game' ----> in ruby 1.9
require File.join(File.dirname(__FILE__), 'player')

player1 = Player.new("moe")
player2 = Player.new("larry", 60)
player3 = Player.new("curly", 125)
player4 = Player.new("shemp", 90)

knuckleheads = Game.new("Knuckleheads")
knuckleheads.add_player(player1)
knuckleheads.add_player(player2)
knuckleheads.add_player(player3)
knuckleheads.play(3)

knuckleheads.print_stats