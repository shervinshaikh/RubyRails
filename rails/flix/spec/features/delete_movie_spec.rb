require 'spec_helper'

describe "Deleting a movie" do

	it "removes the movie and shows the index page without that movie" do
		movie = Movie.create(movie_attributes)

		visit movie_path(movie)

		click_link('Delete')

		expect(current_path).to eq(movies_path)
		expect(page).to_not have_text(movie.title)
	end
end