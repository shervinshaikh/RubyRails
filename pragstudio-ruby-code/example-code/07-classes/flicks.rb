class Movie
  
  def initialize(title, rank=0)
    @title = title.capitalize
    @rank = rank
  end
  
  def thumbs_up
    @rank += 1
  end
  
  def thumbs_down
    @rank -= 1
  end
  
  def to_s
    "#{@title} has a rank of #{@rank}."
  end
end

movie = Movie.new("Goonies", 10)
movie.thumbs_up
movie.thumbs_up
movie.thumbs_down
puts movie
