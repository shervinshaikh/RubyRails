require 'spec_helper'

describe "Deleting a review" do 
  it "destroys the review and shows the movie listing without the review" do
    movie = Movie.create(movie_attributes(title: "Iron Man"))
    review1 = movie.reviews.create(review_attributes(name: "Roger Ebert"))
    review2 = movie.reviews.create(review_attributes(name: "Gene Siskel"))

    visit movie_reviews_url(movie)
    
    expect(page).to have_text(review1.name)
    expect(page).to have_text(review2.name)
    
    click_link "review_#{review1.id}_delete"
    
    expect(current_path).to eq(movie_reviews_path(movie))   
    
    expect(page).to have_text("Review successfully deleted!")
    expect(page).not_to have_text(review1.name)
  end
end