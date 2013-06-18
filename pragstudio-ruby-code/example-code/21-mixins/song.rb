require_relative 'rankable'

class Song  
  include Rankable
  
  attr_accessor :title, :rank

  def initialize(title, rank=0)
    @title = title
    @rank = rank
  end
  
  def to_s
    "#{@title} has a rank of #{@rank} (#{status})"
  end
end

if __FILE__ == $0
  song = Song.new("Hello World", 10)
  song.thumbs_down
  puts song
  song.thumbs_up
  puts song
end