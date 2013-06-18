require_relative 'playlist'

describe Playlist do

  before do
    @playlist = Playlist.new("Kermit")
  end
  
  it "has a name" do
    @playlist.name.should == "Kermit"
  end
  
  it "gives each movie 2 thumbs up and 1 thumbs down when played" do    
    initial_rank = 10
    movie = Movie.new("Goonies", initial_rank)
    
    @playlist.add_movie(movie)
    
    @playlist.play
    
    movie.rank.should == initial_rank + 1 + 1 - 1
  end
  
end
