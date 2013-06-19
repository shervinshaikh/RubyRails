require 'spec_helper'

describe "A movie" do

	it "is a flop if the total gross is less than $50M" do
		movie = Movie.new(movie_attributes(total_gross: 40000000))

		expect(movie.flop?).to be_true
	end

end	