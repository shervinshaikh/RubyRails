require_relative 'player'

describe Player do
  
  before do
    @initial_health = 150
    @player = Player.new("larry", @initial_health)
    $stdout = StringIO.new
  end
  
  it "has a capitalized name" do
    @player.name.should == "Larry"
  end
  
  it "has an initial health" do  
    @player.health.should == 150
  end
  
  it "has a string representation" do  
    @player.to_s.should == "I'm Larry with a health of 150 and a score of 155."
  end
  
  it "computes a score as the sum of its health and length of name" do    
    @player.score.should == (150 + 5)
  end
  
  it "increases health by 15 when w00ted" do
    @player.w00t
    
    @player.health.should == @initial_health + 15
  end
  
  it "decreases health by 10 when blammed" do
    @player.blam
    
    @player.health.should == @initial_health - 10
  end
  
  context "created with a default health" do
    before do
      @player = Player.new("larry")
    end
    
    it "has a health of 100" do
      @player.health.should == 100
    end
  end
  
end