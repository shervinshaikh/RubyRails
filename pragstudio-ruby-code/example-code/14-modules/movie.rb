class Movie
  attr_accessor :title
  attr_reader :rank
  
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
  
  def hit?
    @rank >= 10
  end
  
  def status
    hit? ? "Hit": "Flop"
  end
  
  def to_s
    "#{@title} has a rank of #{@rank} (#{status})"
  end
end

if __FILE__ == $0
  movie = Movie.new("goonies", 10)
  puts movie.title
  puts movie.rank
  movie.thumbs_up
  puts movie.rank
  movie.thumbs_down
  puts movie.rank
end