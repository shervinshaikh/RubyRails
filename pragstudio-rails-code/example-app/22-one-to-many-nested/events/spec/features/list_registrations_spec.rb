require 'spec_helper'

describe "Viewing a list of registrations" do
  
  it "shows the registrations for a specific event" do
    event1 = Event.create(event_attributes(name: "BugSmash"))
    registration1 = event1.registrations.create(registration_attributes(name: "Larry"))
    registration2 = event1.registrations.create(registration_attributes(name: "Moe"))


    event2 = Event.create(event_attributes(name: "Code Kata"))
    registration3 = event2.registrations.create(registration_attributes(name: "Curly"))
    
    visit event_registrations_url(event1)
        
    expect(page).to have_text(registration1.name)
    expect(page).to have_text(registration2.name)
    expect(page).not_to have_text(registration3.name)
  end
end
