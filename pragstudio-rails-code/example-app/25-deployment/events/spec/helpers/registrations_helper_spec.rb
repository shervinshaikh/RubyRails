require 'spec_helper'

describe RegistrationsHelper do
  describe "#register_link" do
    context "when the event is sold out" do
      it "returns 'Sold Out'" do
        event = Event.new(event_attributes(capacity: 0))
        
        expect(register_link_for(event)).to match(/Sold Out/)
      end
    end
    
    context "when the event has spots left" do
      it "returns the register link" do
        event = Event.new(event_attributes(capacity: 1))
        
        expect(register_link_for(event)).to match(/Register/)
      end
    end
  end
end