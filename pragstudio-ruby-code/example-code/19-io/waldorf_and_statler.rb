module WaldorfAndStatler 
  def self.roll_die
    rand(1..6)
  end
  
  def self.review(movie)
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
  end
end
