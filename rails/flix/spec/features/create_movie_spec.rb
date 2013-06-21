require 'spec_helper'

describe "Creating a new movie" do

	it "saves the movie and shows the new movie's details" do
		visit movies_url

		click_link 'Add New Movie'

		expect(current_path).to eq(new_movie_path)

		fill_in 'Title', with: "New Movie Title"
		fill_in 'Description', with: "Superheroes saving the world from villians"
		select "PG-13", :from => "movie_rating"
		fill_in 'Total gross', with: "75000000"
		attach_file "Image", "#{Rails.root}/app/assets/images/ironman.jpg"
		fill_in 'Cast', with: "The award-winning cast"
		fill_in 'Director', with: "The ever-creative director"
		fill_in 'Duration', with: "123 min"
		select (Time.now.year - 1).to_s, :from => "movie_released_on_1i"

		click_button 'Create Movie'

		expect(current_path).to eq(movie_path(Movie.last))

		expect(page).to have_text('New Movie Title')

		expect(page).to have_text('Movie sucessfully created!')
	end

	it "does not save the movie if it's invalid" do
		visit new_movie_url

		expect {
			click_button 'Create Movie'
		}.not_to change(Movie, :count)

		expect(current_path).to eq(movies_path)
		expect(page).to have_text('error')
	end

end	