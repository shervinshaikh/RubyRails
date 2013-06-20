require 'spec_helper'

describe "Viewing the list of projects" do

  it "shows the projects stored in the database" do
    projectA = Project.create(name: "Start-Up Project",
                              description: "A description of a start-up project",
                              target_pledge_amount: 100.00,
                              pledging_ends_on: 1.day.from_now,
                              website: "http://project-a.com",
                              image_file_name: "project-a.png")

    projectB = Project.create(name: "Community Project",
                              description: "A description of a community project",
                              target_pledge_amount: 200.00,
                              pledging_ends_on: 1.week.from_now,
                              website: "http://project-b.com",
                              image_file_name: "project-b.png")

    projectC = Project.create(name: "Personal Project",
                              description: "A description of a person project",
                              target_pledge_amount: 300.00,
                              pledging_ends_on: 1.month.from_now,
                              website: "http://project-c.com",
                              image_file_name: "project-c.png")

    visit projects_url

    expect(page).to have_text(projectA.name)
    expect(page).to have_text(projectB.name)
    expect(page).to have_text(projectC.name)

    expect(page).to have_text(projectA.description)
    expect(page).to have_text("$100.00")
    expect(page).to have_text("1 day remaining")
    expect(page).to have_selector("img[src$='#{projectA.image_file_name}']")
  end

  it "does not show a project that is no longer accepting pledges" do
    project = Project.new(project_attributes(pledging_ends_on: 1.day.ago))
    project.save

    visit projects_path

    expect(page).not_to have_text(project.name)
  end

  it "lists projects in order of pledging ends on date" do
    project1 = Project.new(project_attributes(pledging_ends_on: 2.days.from_now))
    project1.save

    project2 = Project.new(project_attributes(pledging_ends_on: 1.day.from_now))
    project2.save

    visit projects_path

    projects_all = all(".project")
    projects_all[0]["id"].should == "project_#{project2.id}"
    projects_all[1]["id"].should == "project_#{project1.id}"
  end

end
