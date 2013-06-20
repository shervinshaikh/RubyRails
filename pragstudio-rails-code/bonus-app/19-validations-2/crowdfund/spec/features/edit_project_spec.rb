require 'spec_helper'

describe "Editing a project" do

  it "updates the project and shows the project's updated details" do
    project = Project.create(project_attributes)

    visit project_url(project)

    click_link 'Edit'

    expect(current_path).to eq(edit_project_path(project))

    expect(find_field('Name').value).to eq(project.name)

    fill_in 'Name', with: "Updated Project Name"

    click_button 'Update Project'

    expect(current_path).to eq(project_path(project))

    expect(page).to have_text('Updated Project Name')
  end

  it "does not update the project if it's invalid" do
    project = Project.create(project_attributes)

    visit edit_project_url(project)

    fill_in 'Name', with: " "

    click_button 'Update Project'

    expect(page).to have_text('error')
  end

end
