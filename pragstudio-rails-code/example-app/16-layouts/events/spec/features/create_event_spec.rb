require 'spec_helper'

describe "Creating a new event" do 
  it "saves the event and shows the new event's details" do    
    visit events_url
    
    click_link 'Add New Event'
    
    expect(current_path).to eq(new_event_path)
		
    fill_in "event_name", with: "New Event Name"
    fill_in "event_description", with: "A very fun event you should attend"
    fill_in "event_location", with: "Denver, CO"
    fill_in "event_price", with: "10.00"
    select (Time.now.year + 1).to_s, :from => "event_starts_at_1i" # must be in future
    fill_in "event_capacity", with: "75"
    fill_in "event_image_file_name", with: "event.png"
    
    click_button 'Create Event'

    expect(current_path).to eq(event_path(Event.last))   
    
    expect(page).to have_text('New Event Name')
  end
end
