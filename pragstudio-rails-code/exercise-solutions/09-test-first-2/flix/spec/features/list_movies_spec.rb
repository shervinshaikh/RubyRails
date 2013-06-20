require 'spec_helper'

describe "Viewing the list of movies" do
  
  it "shows the movies" do
    visit movies_url

    expect(page).to have_text("3 Movies")
    expect(page).to have_text("Movie 1")
    expect(page).to have_text("Movie 2")
    expect(page).to have_text("Movie 3")
  end    
  
end