require_relative 'game'

describe Game do
  before do
    @game = Game.new("Knuckleheads")
  end
  
  it "has a title" do
    @game.title.should == "Knuckleheads"
  end
  
  it "gives each player 2 w00ts and 1 blam when played" do    
    initial_health = 100
    player = Player.new("moe", initial_health)
    
    @game.add_player(player)
    
    @game.play
    
    player.health.should == initial_health + 15 + 15 - 10
  end
  
end