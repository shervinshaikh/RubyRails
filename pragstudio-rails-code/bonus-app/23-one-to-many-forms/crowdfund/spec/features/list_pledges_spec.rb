require 'spec_helper'

describe "Viewing a list of pledges" do
  
  it "shows the pledges for a specific project" do
    project1 = Project.create(project_attributes(name: "Project 1"))
    pledge1 = project1.pledges.create(pledge_attributes(name: "Mike"))
    pledge2 = project1.pledges.create(pledge_attributes(name: "Nicole"))


    project2 = Project.create(project_attributes(name: "Project 2"))
    pledge3 = project2.pledges.create(pledge_attributes(name: "Bob"))
    
    visit project_pledges_url(project1)
        
    expect(page).to have_text(pledge1.name)
    expect(page).to have_text(pledge2.name)
    expect(page).not_to have_text(pledge3.name)
  end
end