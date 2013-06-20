require 'spec_helper'

describe "A pledge" do

  it "belongs to a project" do
    project = Project.create(project_attributes)

    pledge = project.pledges.new(pledge_attributes)

    expect(pledge.project).to eq(project)
  end

  it "with example attributes is valid" do
    pledge = Pledge.new(pledge_attributes)

    expect(pledge.valid?).to be_true
  end

  it "requires a name" do
    pledge = Pledge.new(name: "")

    expect(pledge.valid?).to be_false
    expect(pledge.errors[:name].any?).to be_true
  end

  it "requires an email" do
    pledge = Pledge.new(email: "")

    expect(pledge.valid?).to be_false
    expect(pledge.errors[:email].any?).to be_true
  end

  it "accepts properly formatted emails" do
    emails = %w[user@example.com USER@example.com first.last@example.com]
    emails.each do |email|
      pledge = Pledge.new(email: email)

      expect(pledge.valid?).to be_false
      expect(pledge.errors[:email].any?).to be_false
    end
  end

  it "rejects improperly formatted emails" do
    emails = %w[user user_at_example.com @example.]
    emails.each do |email|
      pledge = Pledge.new(email: email)

      expect(pledge.valid?).to be_false
      expect(pledge.errors[:email].any?).to be_true
    end
  end

  it "accepts valid amounts" do
    amounts = Pledge::AMOUNT_LEVELS
    amounts.each do |amount|
      pledge = Pledge.new(amount: amount)

      expect(pledge.valid?).to be_false
      expect(pledge.errors[:amount].any?).to be_false
    end
  end

  it "rejects invalid amounts" do
    amounts = [-10.00, 0.00, 13.00]
    amounts.each do |amount|
      pledge = Pledge.new(amount: amount)

      expect(pledge.valid?).to be_false
      expect(pledge.errors[:amount].any?).to be_true
    end
  end
end
