require 'spec_helper'

describe "A project" do
  it "has expired if the pledging ends on date is in the past" do
    project = Project.new(pledging_ends_on: 2.days.ago)

    expect(project.pledging_expired?).to be_true
  end

  it "has not expired if the pledging ends on date is in the future" do
    project = Project.new(pledging_ends_on: 2.days.from_now)

    expect(project.pledging_expired?).to be_false
  end
end
