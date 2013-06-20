require 'spec_helper'

describe "Viewing an individual movie" do
  it "shows the movie's details" do
    movie = Movie.create(movie_attributes(total_gross: 300000000.00))

    visit movie_path(movie)

    expect(page).to have_text(movie.title)
    expect(page).to have_text(movie.rating)
    expect(page).to have_text(movie.description)
    expect(page).to have_text(movie.released_on)
    expect(page).to have_text("$300,000,000.00")
  end

  it "shows the total gross for a movie with greater than $50M" do
    movie = Movie.create(movie_attributes(total_gross: 60000000))

    visit movie_path(movie)

    expect(page).to have_text("$60,000,000.00")
  end

  it "shows 'Flop!' for a movie with a total gross less than $50M" do
    movie = Movie.create(movie_attributes(total_gross: 40000000))

    visit movie_path(movie)

    expect(page).to have_text("Flop!")
  end
end
