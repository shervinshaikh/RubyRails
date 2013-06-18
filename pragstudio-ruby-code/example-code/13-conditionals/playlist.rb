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

  def roll_die
    rand(1..6)
  end
  
  def play
    puts "#{@name}'s playlist:"

    puts @movies
    
    @movies.each do |movie|
      case roll_die
      when 1..2
        movie.thumbs_down
        puts "#{movie.title} got a thumbs down."
      when 3..4
        puts "#{movie.title} was skipped."
      else
        movie.thumbs_up
        puts "#{movie.title} got a thumbs up!"
      end
      puts movie
    end
  end
end

