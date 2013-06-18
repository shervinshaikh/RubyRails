require 'flicks/movie'

module Flicks
  describe Movie do
    before do
      @initial_rank = 10
      @movie = Movie.new("goonies", @initial_rank)
    end
    
    it "has a capitalized title" do
      @movie.title.should == "Goonies"
    end
  
    it "has an initial rank" do  
      @movie.rank.should == 10
    end
  
    it "has a string representation" do
      @movie.to_s.should == "Goonies has a rank of 10 (Hit)"
    end
  
    it "increases rank by 1 when given a thumbs up" do
      @movie.thumbs_up
    
      @movie.rank.should == @initial_rank + 1
    end
  
    it "decreases rank by 1 when given a thumbs down" do
      @movie.thumbs_down
    
      @movie.rank.should == @initial_rank - 1
    end
  
    context "created with a default rank" do
      before do
        @movie = Movie.new("goonies")
      end
    
      it "has a rank of 0" do
        @movie.rank.should == 0
      end
    end
      
    context "with a rank of at least 10" do
      before do
        @movie = Movie.new("goonies", 10)
      end
    
      it "is a hit" do
        @movie.should be_hit
      end
    
      it "has a hit status" do
        @movie.status.should == "Hit"
      end
    end
  
    context "with a rank less than 10" do
      before do
        @movie = Movie.new("goonies", 9)
      end
    
      it "is not a hit" do
        @movie.should_not be_hit
      end
    
      it "has a flop status" do
        @movie.status.should == "Flop"
      end
    end
  
    it "is sorted by decreasing rank" do
      movie1 = Movie.new("goonies", 100)
      movie2 = Movie.new("ghostbusters", 200)
      movie3 = Movie.new("goldfinger", 300)
    
      movies = [movie1, movie2, movie3]
    
      movies.sort.should == [movie3, movie2, movie1]
    end
  
    it "computes carbs consumed as the sum of all snack carbs consumed" do
      @movie.carbs_consumed.should == 0

      @movie.ate_snack(Snack.new(:popcorn, 10))

      @movie.carbs_consumed.should == 10

      @movie.ate_snack(Snack.new(:popcorn, 10))

      @movie.carbs_consumed.should == 20

      @movie.ate_snack(Snack.new(:soda, 5))
    
      @movie.carbs_consumed.should == 25
    end
  
    it "yields each snack" do    
      @movie.ate_snack(Snack.new(:popcorn, 10))
      @movie.ate_snack(Snack.new(:popcorn, 10))
      @movie.ate_snack(Snack.new(:soda, 5))
    
      yielded = []
      @movie.each_snack do |snack|
        yielded << snack
      end
    
      yielded.should == [Snack.new(:popcorn, 20), Snack.new(:soda, 5)]
    end
  
    it "can be instantiated from a CSV string" do
      movie = Movie.from_csv("goonies,10")
    
      movie.title.should == "Goonies"
      movie.rank.should == 10
    end
  
    it "can be serialized to a CSV string" do  
      movie = Movie.new("Goonies", 10)
    
      movie.to_csv.should == "Goonies,10" 
    end
  end
end