module Flicks
  Snack = Struct.new(:name, :carbs)

  module SnackBar  
    SNACKS = [ 
      Snack.new(:nachos,  40),
      Snack.new(:popcorn, 20),  
      Snack.new(:candy,   15),
      Snack.new(:pretzel, 10),
      Snack.new(:soda,     5)
    ]

    def self.random
      SNACKS.sample
    end
  end
end