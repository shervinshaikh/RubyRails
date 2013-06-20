require 'spec_helper'

describe "A movie" do
  it "is a flop if the total gross is less than $50M" do
    movie = Movie.new(total_gross: 40000000)

    expect(movie).to be_flop
  end
  
  it "is not a flop if the total gross is greater than $50M" do
    movie = Movie.new(total_gross: 60000000)

    expect(movie).not_to be_flop
  end
end