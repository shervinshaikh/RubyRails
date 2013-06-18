require_relative 'berserk_player'

describe BerserkPlayer do
  
  before do
    @initial_health = 50 
    @player = BerserkPlayer.new("berserker", @initial_health)
  end
  
  it "does not go berserk when w00ted up to 5 times" do
    1.upto(5) { @player.w00t }
    
    @player.berserk?.should be_false
  end
  
  it "goes berserk when w00ted more than 5 times" do
    1.upto(6) { @player.w00t }
    
    @player.berserk?.should be_true
  end
  
  it "gets w00ted instead of blammed when it's gone berserk" do  
    1.upto(6) { @player.w00t }
    1.upto(2) { @player.blam }
    
    @player.health.should == @initial_health + (8 * 15)
  end

end