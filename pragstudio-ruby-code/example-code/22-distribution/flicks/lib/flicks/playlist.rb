require_relative 'movie'
require_relative 'movie3d'
require_relative 'waldorf_and_statler'
require_relative 'snack_bar'

module Flicks
  class Playlist
    attr_reader :name

    def initialize(name)
      @name = name
      @movies = []
    end

    def add_movie(a_movie)
      @movies << a_movie
    end

    def play(viewings)
      puts "#{@name}'s playlist:"

      puts @movies.sort

      snacks = SnackBar::SNACKS
      puts "\nThere are #{snacks.size} snacks available in the snack bar:"
      snacks.each do |snack|
        puts "#{snack.name} has #{snack.carbs} carbs"
      end

      1.upto(viewings) do |count|
        puts "\nViewing #{count}:"
        @movies.each do |movie|
          WaldorfAndStatler.review(movie)
          snack = SnackBar.random
          movie.ate_snack(snack)
          puts movie
        end
      end
    end

    def total_carbs_consumed
      @movies.reduce(0) { |sum, movie| sum + movie.carbs_consumed }
    end

    def print_stats
      puts "\n#{@name}'s Stats:"

      hits, flops = @movies.partition {|movie| movie.hit? }

      puts "\nHits:"
      puts hits.sort

      puts "\nFlops:"
      puts flops.sort

      puts "\n#{total_carbs_consumed} total carbs consumed"    
      @movies.sort.each do |movie|
        puts "\n#{movie.title}'s snack totals:"
        movie.each_snack do |snack|
          puts "#{snack.carbs} total #{snack.name} carbs"
        end
        puts "#{movie.carbs_consumed} grand total carbs"
      end
    end

    def load(from_file)
      File.readlines(from_file).each do |line|
        add_movie(Movie.from_csv(line))
      end
    end

    def save(to_file="movie_rankings.csv")
      File.open(to_file, "w") do |file|
        file.puts @movies.sort.map { |movie| movie.to_csv }
      end
    end
  end
end