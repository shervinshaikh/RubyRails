require 'spec_helper'

describe "Navigating movies" do
  
  it "has a link on the show page to list all movies" do

    movie = Movie.create(movie_attributes)

    visit movie_path(movie)

    click_link "All Movies"

    expect(current_path).to eq(movies_path)
  end
  
  it "has a link on the index page to show a movie" do

    movie = Movie.create(movie_attributes)

    visit movies_path

    click_link movie.title

    expect(current_path).to eq(movie_path(movie))
  end
end