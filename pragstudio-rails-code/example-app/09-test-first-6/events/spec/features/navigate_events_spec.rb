require 'spec_helper'

describe "Navigating events" do

  it "has a link on the show page to list all events" do
    event = Event.create(event_attributes)
                          
    visit event_path(event)
        
    click_link "All Events"
    
    expect(current_path).to eq(events_path)
  end
  
  it "has a link on the index page to show an event" do
    event = Event.create(event_attributes)
                          
    visit events_path
        
    click_link event.name
    
    expect(current_path).to eq(event_path(event))

  end
  
end