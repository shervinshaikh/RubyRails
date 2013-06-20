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

  it "requires a name" do
    project = Project.new(name: "")

    expect(project.valid?).to be_false
    expect(project.errors[:name].any?).to be_true
  end

  it "requires a description" do
    project = Project.new(description: "")

    expect(project.valid?).to be_false
    expect(project.errors[:description].any?).to be_true
  end

  it "accepts a description up to 500 characters" do
    project = Project.new(description: "X" * 501)

    expect(project.valid?).to be_false
    expect(project.errors[:description].any?).to be_true
  end

  it "accepts a positive target pledge amount" do
    project = Project.new(target_pledge_amount: 10.00)

    expect(project.valid?).to be_false
    expect(project.errors[:target_pledge_amount].any?).to be_false
  end

  it "rejects a $0 target pledge amount" do
    project = Project.new(target_pledge_amount: 0.00)

    expect(project.valid?).to be_false
    expect(project.errors[:target_pledge_amount].any?).to be_true
  end

  it "rejects a negative target pledge amount" do
    project = Project.new(target_pledge_amount: -10.00)

    expect(project.valid?).to be_false
    expect(project.errors[:target_pledge_amount].any?).to be_true
  end

  it "accepts properly formatted website URLs" do
    sites = %w[http://example.com https://example]
    sites.each do |site|
      project = Project.new(website: site)

      expect(project.valid?).to be_false
      expect(project.errors[:website].any?).to be_false
    end
  end

  it "rejects improperly formatted website URLs" do
    sites = %w[example.com http examplehttp]
    sites.each do |site|
      project = Project.new(website: site)

      expect(project.valid?).to be_false
      expect(project.errors[:website].any?).to be_true
    end
  end

  it "accepts properly formatted image file names" do
    file_names = %w[e.png event.png event.jpg event.gif EVENT.GIF]
    file_names.each do |file_name|
      project = Project.new(image_file_name: file_name)

      expect(project.valid?).to be_false
      expect(project.errors[:image_file_name].any?).to be_false
    end
  end

  it "rejects improperly formatted image file names" do
    file_names = %w[event .jpg .png .gif event.pdf event.doc]
    file_names.each do |file_name|
      project = Project.new(image_file_name: file_name)

      expect(project.valid?).to be_false
      expect(project.errors[:image_file_name].any?).to be_true
    end
  end

  it "has many pledges" do
    project = Project.new(project_attributes)

    pledge1 = project.pledges.new(pledge_attributes)
    pledge2 = project.pledges.new(pledge_attributes)

    expect(project.pledges).to include(pledge1)
    expect(project.pledges).to include(pledge2)
  end

  it "deletes associated pledges" do
    project = Project.create(project_attributes)

    project.pledges.create(pledge_attributes)

    expect {
      project.destroy
    }.to change(Pledge, :count).by(-1)
  end

  it "calculates the total amount pledged as the sum of all pledges" do
    project = Project.create(project_attributes)
    project.pledges.create!(pledge_attributes(amount: 25.00))
    project.pledges.create!(pledge_attributes(amount: 50.00))

    expect(project.total_amount_pledged).to eq(75.00)
  end

  it "calculates the pledge amount outstanding" do
    project = Project.create(project_attributes(target_pledge_amount: 100.00))
    project.pledges.create!(pledge_attributes(amount: 50.00))

    expect(project.amount_outstanding).to eq(50.00)
  end

  it "is funded if the target pledge amount has been reached" do
    project = Project.create(project_attributes(target_pledge_amount: 100.00))
    project.pledges.create!(pledge_attributes(amount: 50.00))
    project.pledges.create!(pledge_attributes(amount: 50.00))

    expect(project.funded?).to be_true
  end

  it "is not funded if the target pledge amount has not been reached" do
    project = Project.create(project_attributes(target_pledge_amount: 100.00))
    project.pledges.create!(pledge_attributes(amount: 50.00))

    expect(project.funded?).to be_false
  end

  it "decrements the amount outstanding when a pledge is created" do
    project = Project.create(project_attributes(target_pledge_amount: 50.00))

    expect {
      project.pledges.create!(pledge_attributes(amount: 25.00))
    }.to change(project, :amount_outstanding).by(-25)
  end

end
