require_relative 'snack_bar'

class Movie
  attr_accessor :title
  attr_reader :rank
  
  def initialize(title, rank=0)
    @title = title.capitalize
    @rank = rank
    @snack_carbs = Hash.new(0)
  end
  
  def thumbs_up
    @rank += 1
  end
  
  def thumbs_down
    @rank -= 1
  end
  
  def ate_snack(snack)
    @snack_carbs[snack.name] += snack.carbs
    puts "#{@title} led to #{snack.carbs} #{snack.name} carbs being consumed."
  end
  
  def carbs_consumed    
    @snack_carbs.values.reduce(0, :+)
  end
  
  def hit?
    @rank >= 10
  end
  
  def status
    hit? ? "Hit": "Flop"
  end
  
  def each_snack
    @snack_carbs.each do |name, carbs|
      yield Snack.new(name,  carbs)
    end
  end
  
  def to_s
    "#{@title} has a rank of #{@rank} (#{status})"
  end
  
  def <=>(other)
    other.rank <=> @rank
  end
  
  def to_csv
    "#{@title},#{@rank}"
  end
  
  def self.from_csv(string)
    title, rank = string.split(',')    
    new(title, Integer(rank))
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