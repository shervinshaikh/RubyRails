require_relative 'clumsy_player'

describe ClumsyPlayer do
  
  before do
    @player = ClumsyPlayer.new("klutz")
  end
  
  it "only gets half the point value for each treasure" do
    @player.points.should == 0

    hammer = Treasure.new(:hammer, 50)
    @player.found_treasure(hammer)
    @player.found_treasure(hammer)
    @player.found_treasure(hammer)

    @player.points.should == 75

    crowbar = Treasure.new(:crowbar, 400)
    @player.found_treasure(crowbar)
    
    @player.points.should == 275    
    
    yielded = []
    @player.each_found_treasure do |treasure|
      yielded << treasure
    end

    yielded.should == [Treasure.new(:hammer, 75), Treasure.new(:crowbar, 200)]    
  end

end