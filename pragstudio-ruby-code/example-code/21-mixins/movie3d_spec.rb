require_relative 'movie3d'

describe Movie3D do

  before do
    @initial_rank = 10
    @wow_factor = 5
    @movie = Movie3D.new('Glee', @initial_rank, @wow_factor)
  end
  
  it "has a title" do
    @movie.title.should == "Glee"
  end
  
  it "has a rank" do
    @movie.rank.should == 10
  end
  
  it "has a wow factor" do
    @movie.wow_factor.should == 5
  end
  
  it "increases rank by 1 times the wow factor when given a thumbs up" do
    @movie.thumbs_up
  
    @movie.rank.should == @initial_rank + (1 * @wow_factor)
  end

  it "decreases rank by 1 when given a thumbs down" do
    @movie.thumbs_down
  
    @movie.rank.should == @initial_rank - 1
  end
end