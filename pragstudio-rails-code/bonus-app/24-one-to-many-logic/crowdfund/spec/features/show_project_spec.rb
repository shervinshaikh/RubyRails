require 'spec_helper'

describe "Viewing an individual project" do

  it "shows the project's details" do
    project = Project.create(project_attributes(target_pledge_amount: 100, pledging_ends_on: 1.day.from_now))

    visit project_url(project)

    expect(page).to have_text(project.name)
    expect(page).to have_text(project.description)
    expect(page).to have_text("$100.00")
    expect(page).to have_text("1 day remaining")
    expect(page).to have_text(project.website)
    expect(page).to have_text(project.team_members)
    expect(page).to have_selector("img[src$='#{project.image_file_name}']")
  end

  it "shows the days remaining if the pledging end date is in the future" do
    project = Project.create(project_attributes(pledging_ends_on: 1.day.from_now))

    visit project_url(project)

    expect(page).to have_text("1 day remaining")
  end

  it "shows 'All Done!' if the pledging end date is in the past" do
    project = Project.create(project_attributes(pledging_ends_on: 2.days.ago))

    visit project_url(project)

    expect(page).to have_text("All Done!")
  end
  
  it "shows the amount outstanding with a pledge link if the project is not funded" do
    project = Project.create(project_attributes(target_pledge_amount: 50.00))
    project.pledges.create(pledge_attributes(amount: 25.00))

    visit project_url(project)

    expect(page).to have_link("Only $25.00 left!")    
    expect(page).to have_link("Pledge!")
    expect(page).not_to have_text("Funded!")
  end

  it "shows 'Funded' without a pledge link if the project is funded" do
    project = Project.create(project_attributes(target_pledge_amount: 25.00))
    project.pledges.create(pledge_attributes(amount: 25.00))
  
    visit project_url(project)

    expect(page).to have_text("Funded!")
    expect(page).not_to have_link("Pledge!")
  end

end
