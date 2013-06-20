require 'spec_helper'

describe "Creating a new pledge" do
  it "saves the pledge if it's valid" do
    project = Project.create(project_attributes)

    visit project_url(project)

    click_link 'Pledge!'

    expect(current_path).to eq(new_project_pledge_path(project))

    fill_in "Name",  with: "Joe Smith"
    fill_in "Email", with: "joe@gmail.com"
    select  "100.0", :from => "pledge_amount"
    fill_in "Comment", with: "Count me in!"

    click_button 'Create Pledge'

    expect(current_path).to eq(project_pledges_path(project))

    expect(page).to have_text("Thanks for pledging!")
    expect(page).to have_text("Joe Smith")
    expect(page).to have_text("$100.00")
  end

  it "does not save the pledge if it's invalid" do
    project = Project.create(project_attributes)

    visit new_project_pledge_url(project)

    expect {
      click_button 'Create Pledge'
    }.not_to change(Pledge, :count)

    expect(page).to have_text('error')
  end

end
