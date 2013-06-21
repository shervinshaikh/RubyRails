require 'spec_helper'

describe "View an individual movie" do

	it "shows the details for one movie" do
		movie = Movie.create(movie_attributes)

		visit movie_url(movie)

		expect(page).to have_text(movie.title)
		expect(page).to have_text(movie.rating)
		# expect(page).to have_text("$318,412,101.00")
		expect(page).to have_text(movie.description)
		expect(page).to have_text(movie.released_on)
		expect(page).to have_text(movie.cast)
		expect(page).to have_text(movie.director)
		expect(page).to have_text(movie.duration)
		expect(page).to have_selector("img[src$='#{movie.image.url}']")
	end

	it "shows the total gross if total gross greater than $50M" do
		movie = Movie.create(movie_attributes(total_gross: 60000000))

		visit movie_url(movie)

		expect(page).to have_text("$60,000,000")
	end

	it "shows 'Flop!' if the total gross is less than $50M" do
		movie = Movie.create(movie_attributes(total_gross: 40000000))

		visit movie_url(movie)

		expect(page).to have_text("Flop!")
	end

end	