require 'spec_helper'

describe "Viewing an individual project" do

  it "shows the project's details" do
    project = Project.create(project_attributes(target_pledge_amount: 100))

    visit project_url(project)

    expect(page).to have_text(project.name)
    expect(page).to have_text(project.description)
    expect(page).to have_text("$100.00")
    expect(page).to have_text(project.pledging_ends_on)
    expect(page).to have_text(project.website)
  end

end
