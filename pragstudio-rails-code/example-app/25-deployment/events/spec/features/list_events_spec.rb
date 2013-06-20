require 'spec_helper'

describe "Viewing the list of events" do
  
  it "shows an empty page if no events exist" do
    visit events_url

    expect(all(".event").empty?).to be_true
  end
  
  it "shows the events" do
    event1 = Event.create(name: "BugSmash",
                          location: "Denver",
                          price: 10.00,
                          description: 'A fun evening of bug smashing!',
                          starts_at: 10.days.from_now,
                          image_file_name: 'bugsmash.png',
                          capacity: 75)

    event2 = Event.create(name: "Hackathon",
                          location: "Austin",
                          price: 15.00,
                          description: 'Hunker down at the Hackathon!',
                          starts_at: 15.days.from_now,
                          image_file_name: 'hackathon.png',
                          capacity: 100)

    event3 = Event.create(name: "Kata Camp",
                          location: "Dallas",
                          price: 75.00,
                          description: 'Practice your craft kata style!',
                          starts_at: 30.days.from_now,
                          image_file_name: 'katacamp.png',
                          capacity: 50)
    
    visit events_url
    
    expect(page).to have_text(event1.name)
    expect(page).to have_text(event2.name)
    expect(page).to have_text(event3.name)

    expect(page).to have_text(event1.location)
    expect(page).to have_text(event1.description[0..10])
    expect(page).to have_text(event1.starts_at)
    expect(page).to have_text("$10.00")
    expect(page).to have_text(event1.capacity)
    expect(page).to have_selector("img[src$='#{event1.image_file_name}']")
  end
  
  it "does not show an event that starts in the past" do
    event = Event.new(event_attributes)
    event.starts_at = 1.day.ago
    event.save
    
    visit events_url
    
    expect(page).not_to have_text(event.name)
  end
  
  it "shows the events in order of date" do
    event1 = Event.new(event_attributes)
    event1.starts_at = 2.days.from_now
    event1.save
    
    event2 = Event.new(event_attributes)
    event2.starts_at = 1.day.from_now
    event2.save
    
    visit events_url  
  
    events_all = all(".event")
    expect(events_all[0]["id"]).to eq("event_#{event2.id}")
    expect(events_all[1]["id"]).to eq("event_#{event1.id}")
  end

end
