require_relative 'playlist'

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
      
      @playlist.play
    
      @movie.rank.should == @initial_rank + 1

      WaldorfAndStatler.stub(:roll_die).and_return(5)
      
      @playlist.play
    
      @movie.rank.should == @initial_rank + 2
    end
    
    it "skips the movie if a medium number is rolled" do
      WaldorfAndStatler.stub(:roll_die).and_return(4)
      
      @playlist.play
    
      @movie.rank.should == @initial_rank

      WaldorfAndStatler.stub(:roll_die).and_return(3)
      
      @playlist.play
    
      @movie.rank.should == @initial_rank
    end
    
    it "gives the movie a thumbs down if a low number is rolled" do    
      WaldorfAndStatler.stub(:roll_die).and_return(2)
      
      @playlist.play
    
      @movie.rank.should == @initial_rank - 1

      WaldorfAndStatler.stub(:roll_die).and_return(1)
      
      @playlist.play
    
      @movie.rank.should == @initial_rank - 2
    end
  end
  
end