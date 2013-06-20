require 'spec_helper'

describe "Navigating projects" do

  it "allows navigation from the detail page to the listing page" do
    project = Project.create(project_attributes)

    visit project_url(project)

    click_link "All Projects"

    expect(current_path).to eq(projects_path)
  end

  it "allows navigation from the listing page to the detail page" do
    project = Project.create(project_attributes)

    visit projects_url

    click_link project.name

    expect(current_path).to eq(project_path(project))
  end
end
