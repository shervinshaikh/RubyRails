require 'flicks/playlist'

module Flicks
  describe Playlist do
    before do
      @playlist = Playlist.new("Kermit")
    end
  
    it "has a name" do
      @playlist.name.should == "Kermit"
    end
  
    context "being played with one movie" do
      before do
        @initial_rank = 10
        @movie = Movie.new("Goonies", @initial_rank)
      
        @playlist.add_movie(@movie)
      end
  
      it "gives the movie a thumbs up if a high number is rolled" do    
        WaldorfAndStatler.stub(:roll_die).and_return(6)
      
        @playlist.play(2)
    
        @movie.rank.should == @initial_rank + 2

        WaldorfAndStatler.stub(:roll_die).and_return(5)
      
        @playlist.play(2)
    
        @movie.rank.should == @initial_rank + 4
      end
    
      it "skips the movie if a medium number is rolled" do
        WaldorfAndStatler.stub(:roll_die).and_return(4)
      
        @playlist.play(2)
    
        @movie.rank.should == @initial_rank

        WaldorfAndStatler.stub(:roll_die).and_return(3)
      
        @playlist.play(2)
    
        @movie.rank.should == @initial_rank
      end
    
      it "gives the movie a thumbs down if a low number is rolled" do    
        WaldorfAndStatler.stub(:roll_die).and_return(2)
      
        @playlist.play(2)
    
        @movie.rank.should == @initial_rank - 2

        WaldorfAndStatler.stub(:roll_die).and_return(1)
      
        @playlist.play(2)
    
        @movie.rank.should == @initial_rank - 4
      end
    end

    context "with movies that have caused snacks to be consumed" do
      before do
        movie1 = Movie.new("goonies")
        movie2 = Movie.new("ghostbusters")

        @playlist.add_movie(movie1)
        @playlist.add_movie(movie2)

        movie1.ate_snack(Snack.new(:popcorn, 10))
        movie1.ate_snack(Snack.new(:popcorn, 10))
        movie2.ate_snack(Snack.new(:soda, 5))
      end
    
      it "computes total carbs consumed as the sum of all movie carbs consumed" do
        @playlist.total_carbs_consumed.should == 25
      end
    end
  end
end