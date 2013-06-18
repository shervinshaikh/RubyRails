require_relative 'movie'

module Flicks
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
end