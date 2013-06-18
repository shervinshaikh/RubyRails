require_relative 'snack_bar'
require_relative 'rankable'

module Flicks
  class Movie
    include Rankable

    attr_accessor :title, :rank

    def initialize(title, rank=0)
      @title = title.capitalize
      @rank = rank
      @snack_carbs = Hash.new(0)
    end

    def ate_snack(snack)
      @snack_carbs[snack.name] += snack.carbs
      puts "#{@title} led to #{snack.carbs} #{snack.name} carbs being consumed."
    end

    def carbs_consumed    
      @snack_carbs.values.reduce(0, :+)
    end

    def each_snack
      @snack_carbs.each do |name, carbs|
        yield Snack.new(name,  carbs)
      end
    end

    def to_s
      "#{@title} has a rank of #{@rank} (#{status})"
    end

    def to_csv
      "#{@title},#{@rank}"
    end

    def self.from_csv(string)
      title, rank = string.split(',')    
      new(title, Integer(rank))
    end
  end
end