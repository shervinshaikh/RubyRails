require_relative 'movie'

class Movie3D < Movie
  attr_reader :wow_factor
  
  def initialize(name, rank, wow_factor)
    super(name, rank)
    @wow_factor = wow_factor
  end
  
  def thumbs_up
    @wow_factor.times { super }
  end
  
  def show_effect
    puts "Wow! " * @wow_factor
  end
  
end

if __FILE__ == $0
  movie3d = Movie3D.new('Glee', 5, 10)
  movie3d.thumbs_up
  puts movie3d.rank
  movie3d.thumbs_down
  puts movie3d.rank
  puts movie3d
  movie3d.show_effect
end
