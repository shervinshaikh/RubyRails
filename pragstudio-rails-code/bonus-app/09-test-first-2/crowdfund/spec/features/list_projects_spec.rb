require 'spec_helper'

describe "Viewing the list of projects" do

  it "shows three project names" do
    visit projects_url

    expect(page).to have_text("3 Projects")
    expect(page).to have_text("Project A")
    expect(page).to have_text("Project B")
    expect(page).to have_text("Project C")
  end
end
