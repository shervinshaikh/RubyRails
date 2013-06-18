require 'flicks/snack_bar'

module Flicks
  describe Snack do
    before do
      @snack = Snack.new(:pretzel, 10)
    end
  
    it "has a name attribute" do
      @snack.name.should == :pretzel
    end
  
    it "has a carbs attribute" do
      @snack.carbs.should == 10
    end
  
  end
end

module Flicks
  describe SnackBar do
    it "has a trove of treasures" do
      SnackBar::SNACKS.should_not be_empty
    end
  
    it "returns a random treasure" do
      snack = SnackBar.random
    
      SnackBar::SNACKS.should include(snack)
    end
  end
end