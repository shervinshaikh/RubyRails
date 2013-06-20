require 'spec_helper'

describe "Creating a new movie" do

	it "saves the movie and shows the new movie's details" do
		visit movies_url

		click_link 'Add New Movie'

		expect(current_path).to eq(new_movie_path)

		fill_in 'Title', with: "New Movie Title"
		fill_in 'Description', with: "Superheroes saving the world from villians"
		fill_in 'Rating', with: "PG-13"
		fill_in 'Total gross', with: "75000000"
		fill_in 'Image file name', with: "movie.png"

		click_button 'Create Movie'

		expect(current_path).to eq(movie_path(Movie.last))

		expect(page).to have_text('New Movie Title')
	end

end	