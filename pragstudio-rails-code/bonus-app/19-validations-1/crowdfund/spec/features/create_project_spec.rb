require 'spec_helper'

describe "Creating a new project" do
  it "saves the project and shows the new project's details" do
    visit projects_url

    click_link 'Add New Project'

    expect(current_path).to eq(new_project_path)

    fill_in "Name", with: "New Project Name"
    fill_in "Description", with: "A brand new project"
    fill_in "Target pledge amount", with: "3000"
    select (Time.now.year + 1).to_s, :from => "project_pledging_ends_on_1i"
    fill_in "Website", with: "http://example.com"
    fill_in "Team members", with: "The team members"
    fill_in "Image Filename", with: "project.png"

    click_button 'Create Project'

    expect(current_path).to eq(project_path(Project.last))

    expect(page).to have_text('New Project Name')
  end
end
