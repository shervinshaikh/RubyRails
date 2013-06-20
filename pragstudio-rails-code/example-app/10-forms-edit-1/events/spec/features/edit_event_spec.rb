require 'spec_helper'

describe "Editing an event" do

  it "updates the event and shows the event's updated details" do
    event = Event.create(event_attributes)

    visit event_url(event)

    click_link 'Edit'

    expect(current_path).to eq(edit_event_path(event))

    expect(find_field('event_name').value).to eq(event.name)
  end

end

