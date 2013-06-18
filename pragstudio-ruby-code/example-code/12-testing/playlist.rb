require_relative 'movie'

class Playlist
  
  attr_reader :name
  
  def initialize(name)
    @name = name
    @movies = []
  end
  
  def add_movie(a_movie)
    @movies << a_movie
  end

  def play
    puts "#{@name}'s playlist:"
    puts @movies
    @movies.each do |movie|
      movie.thumbs_up
      movie.thumbs_up
      movie.thumbs_down
      puts movie
    end
  end

end
